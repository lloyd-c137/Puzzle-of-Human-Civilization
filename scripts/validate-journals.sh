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
  "Phy/Physics Chapter 3 Learning Journal.md"
  "Math/Statistics Units 3, 6, and 7 Learning Journal.md"
)

learning_files=(
  "Bio/A Place as an Ecological System Learning Journal.md"
  "Chem Journal/Chemical Foundations Unit Journal.md"
  "Phy/Physics Chapter 1 Learning Journal.md"
)

overview_sections=(
  "Purpose"
  "Current overview"
  "Unit journals"
  "Current learning focus"
  "Recurring mistakes"
  "Recent progress"
)

unit_sections=(
  "Unit purpose"
  "Progress dashboard"
  "Key knowledge and vocabulary"
  "Learning records"
  "Concepts to revisit"
  "Mistakes and corrections"
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

check_platform() {
  local file="$1"
  local expected="$2"
  if ! rg -q -F "learning_platform: $expected" "$file"; then
    fail "$file: expected learning_platform: $expected"
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
  local prohibited='^## (Long-term learning goals|Unit learning goals|Historical learning roadmap|How I will study|Study record format|Current progress|Ongoing records|Previous conversation entries|Stage[[:space:]]|Questions carried across units|Questions I am carrying forward|Questions carried forward|Recent reviews|Review record)'

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

check_record_contract() {
  local file="$1"
  local violations
  violations=$(awk -v file="$file" '
    function violation(line, message) { print file ":" line ": " message }
    /^### Learning record — / {
      if (in_record && field != 3) violation(NR, "record must end with question/respond/reflection")
      in_record = 1
      field = 0
      next
    }
    # Verbatim learner questions may contain Markdown headings. They are
    # content, not record boundaries, while the question field is active.
    in_record && field != 1 && /^## / {
      if (field != 3) violation(NR, "record must contain exactly question/respond/reflection")
      in_record = 0
      field = 0
      next
    }
    in_record && /^#### / {
      if ($0 == "#### question" && field == 0) field = 1
      else if ($0 == "#### respond" && field == 1) field = 2
      else if ($0 == "#### reflection" && field == 2) field = 3
      else if (field == 1) next
      else violation(NR, "unexpected or out-of-order field heading: " $0)
      next
    }
    in_record && field != 1 && /^### / { violation(NR, "nested heading is not allowed inside a learning record") }
    # The question field is copied verbatim from the learner message, so its
    # Markdown must not be rewritten or rejected as a journal subheading.
    in_record && field != 1 && /^[[:space:]]*\*\*.*\*\*[[:space:]]*$/ { violation(NR, "bold-only subheading/label is not allowed inside a learning record") }
    in_record && field != 1 && /\*\*[^*]+[:：]\*\*/ { violation(NR, "bold inline field label is not allowed inside a learning record") }
    END {
      if (in_record && field != 3) violation(NR, "record must end with question/respond/reflection")
    }
  ' "$file")
  if [[ -n "$violations" ]]; then
    printf '%s\n' "$violations" >&2
    fail "$file: learning records may contain only the three plain fields"
  fi
}

for file in "${overview_files[@]}"; do
  check_file "$file" || continue
  check_metadata "$file" learning_journal
  check_platform "$file" independent
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
  check_metadata "$file" unit_learning_journal
  check_platform "$file" khan-academy
  check_sections "$file" "${unit_sections[@]}"
  check_no_prohibited_headings "$file"
  records=$(rg -c '^### Learning record — ' "$file" || true)
  questions=$(rg -c '^#### question$' "$file" || true)
  responses=$(rg -c '^#### respond$' "$file" || true)
  reflections=$(rg -c '^#### reflection$' "$file" || true)
  if [[ "${records:-0}" -eq 0 ]]; then
    fail "$file: no learning record found"
  elif [[ "$records" -ne "$questions" || "$records" -ne "$responses" || "$records" -ne "$reflections" ]]; then
    fail "$file: each learning record must contain exactly question/respond/reflection"
  fi
  check_record_contract "$file"
done

for file in "${learning_files[@]}"; do
  check_file "$file" || continue
  check_metadata "$file" learning_journal
  check_platform "$file" independent
  check_sections "$file" "Purpose" "Progress dashboard" "Key knowledge and vocabulary" "Learning records" "Concepts to revisit" "Mistakes and corrections"
  check_no_prohibited_headings "$file"
  records=$(rg -c '^### Learning record — ' "$file" || true)
  questions=$(rg -c '^#### question$' "$file" || true)
  responses=$(rg -c '^#### respond$' "$file" || true)
  reflections=$(rg -c '^#### reflection$' "$file" || true)
  if [[ "${records:-0}" -eq 0 ]]; then
    fail "$file: no learning record found"
  elif [[ "$records" -ne "$questions" || "$records" -ne "$responses" || "$records" -ne "$reflections" ]]; then
    fail "$file: each learning record must contain exactly question/respond/reflection"
  fi
  check_record_contract "$file"
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
    "## Learning records"; do
    if ! has_heading "Journal Template.md" "${required#\#\# }"; then
      fail "Journal Template.md: missing section: $required"
    fi
  done
  if rg -n '^## (Long-term learning goals|Unit learning goals)$' "Journal Template.md"; then
    fail "Journal Template.md: prohibited goal section found"
  fi
fi

# Do not normalize or reject whitespace inside question fields: learner
# messages are copied verbatim, and Markdown line-break spaces are part of
# that source text. Structural checks above remain authoritative.

if (( failures > 0 )); then
  printf '%d journal validation failure(s)\n' "$failures" >&2
  exit 1
fi

printf 'Journal validation passed: %d overview files, %d Unit Learning files, %d Learning files, and Journal Template.md\n' \
  "${#overview_files[@]}" "${#unit_files[@]}" "${#learning_files[@]}"
