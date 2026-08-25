#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

overview_files=(
  "Math/Math Learning Journal.md"
  "Bio/Biology Learning Journal.md"
  "Chem Journal/Chemical Foundations learning journey.md"
  "Phy/Physics Learning Journal.md"
)

unit_files=(
  "Math/Statistics Units 1-2 Learning Journal.md"
  "Bio/Biology Units 1 and 4 Learning Journal.md"
  "Chem Journal/Chemical Foundations Unit Journal.md"
  "Phy/Physics Chapter 1 Learning Journal.md"
  "Phy/Physics Chapter 3 Learning Journal.md"
)

overview_sections=(
  "Purpose"
  "Current overview"
  "Unit journals"
  "Current learning focus"
  "Questions carried across units"
  "Recurring mistakes"
  "Recent progress"
)

unit_sections=(
  "Unit purpose"
  "Progress dashboard"
  "Key knowledge and vocabulary"
  "Learning entries"
  "Concepts to revisit"
  "Mistakes and corrections"
  "Questions I am carrying forward"
  "Review record"
)

failures=0

fail() {
  printf 'FAIL: %s\n' "$1" >&2
  failures=$((failures + 1))
}

check_file() {
  local file="$1"
  if [[ ! -f "$file" ]]; then
    fail "missing file: $file"
    return 1
  fi
}

has_heading() {
  local file="$1"
  local heading="$2"
  rg -q -F "## $heading" "$file"
}

check_metadata() {
  local file="$1"
  local expected_type="$2"

  if ! rg -q -F "journal_type: $expected_type" "$file"; then
    fail "$file: expected journal_type: $expected_type"
  fi

  if ! rg -q '^section: (Mathematics|Biology|Chemistry|Physics)$' "$file"; then
    fail "$file: missing or invalid section metadata"
  fi

  if ! rg -q '^subject: (Mathematics|Biology|Chemistry|Physics)$' "$file"; then
    fail "$file: missing or invalid subject metadata"
  fi
}

check_sections() {
  local file="$1"
  shift

  local section
  for section in "$@"; do
    if ! has_heading "$file" "$section"; then
      fail "$file: missing section: $section"
    fi
  done
}

check_no_prohibited_headings() {
  local file="$1"
  local prohibited='^## (Long-term learning goals|Unit learning goals|Historical learning roadmap|How I will study|Study record format|Current progress|Ongoing records|Previous conversation entries|Stage[[:space:]])'

  if rg -n "$prohibited" "$file"; then
    fail "$file: prohibited legacy heading found"
  fi
}

check_biology_overview_rules() {
  local file="$1"
  if [[ "$file" == "Bio/Biology Learning Journal.md" ]] && rg -q '^## Questions carried across units$' "$file"; then
    fail "$file: Biology overview must not contain Questions carried across units"
  fi
}

for file in "${overview_files[@]}"; do
  check_file "$file" || continue
  check_metadata "$file" overview
  if [[ "$file" == "Bio/Biology Learning Journal.md" ]]; then
    check_sections "$file" \
      "Purpose" \
      "Current overview" \
      "Unit journals" \
      "Current learning focus" \
      "Recurring mistakes" \
      "Recent progress"
  else
    check_sections "$file" "${overview_sections[@]}"
  fi
  check_no_prohibited_headings "$file"
  check_biology_overview_rules "$file"
done

for file in "${unit_files[@]}"; do
  check_file "$file" || continue
  check_metadata "$file" unit
  check_sections "$file" "${unit_sections[@]}"
  check_no_prohibited_headings "$file"
  if ! rg -q '^### Learning entry — ' "$file"; then
    fail "$file: no standardized learning entry found"
  fi
done

if [[ ! -f "Journal Template.md" ]]; then
  fail "missing file: Journal Template.md"
else
  for required in \
    "## Overview journal front matter" \
    "## Overview journal body" \
    "## Unit journal front matter" \
    "## Unit journal body" \
    "## Progress dashboard" \
    "## Learning entries"; do
    if ! has_heading "Journal Template.md" "${required#\#\# }"; then
      fail "Journal Template.md: missing section: $required"
    fi
  done
  if rg -n '^## (Long-term learning goals|Unit learning goals)$' "Journal Template.md"; then
    fail "Journal Template.md: prohibited goal section found"
  fi
fi

if ! git diff --check; then
  fail "git diff --check failed"
fi

if (( failures > 0 )); then
  printf '%d journal validation failure(s)\n' "$failures" >&2
  exit 1
fi

printf 'Journal validation passed: %d overview files, %d Unit files, and Journal Template.md\n' \
  "${#overview_files[@]}" "${#unit_files[@]}"
