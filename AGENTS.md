# PHC Journal Rules

These rules apply to all learning-journal work in this repository.

## Before editing

Read `/Journal Template.md` before creating or editing a learning Journal.
Treat the template and this file as the source of truth for Journal structure.

The four subject overview Journals are:

- `Math/Math Learning Journal.md`
- `Bio/Biology Learning Journal.md`
- `Chem Journal/Chemical Foundations learning journey.md`
- `Phy/Physics Learning Journal.md`

The current Unit Journals are identified by `journal_type: unit` in their front matter. Specialized experiment or assignment records without `journal_type: overview` or `journal_type: unit` are not learning Journals and must not be forced into this format.

## Required overview structure

Each subject has one overview Journal. Its top-level sections must be:

- `Purpose`
- `Current overview`
- `Unit journals`
- `Current learning focus`
- `Questions carried across units`
- `Recurring mistakes`
- `Recent progress`

The overview records status and navigation only. Do not duplicate complete learning entries from Unit Journals in it.

Biology-specific rule: `Bio/Biology Learning Journal.md` must not contain a `Questions carried across units` section. Biology questions belong in the Unit Journal's `Questions I am carrying forward` section or in the relevant learning entry.

## Required Unit structure

Each Unit Journal must use these top-level sections:

- `Unit purpose`
- `Progress dashboard`
- `Key knowledge and vocabulary`
- `Learning entries`
- `Concepts to revisit`
- `Mistakes and corrections`
- `Questions I am carrying forward`
- `Review record`

Detailed learning records belong under `Learning entries`. Keep actual understanding, examples, questions, mistakes, corrections, confidence, progress, and next focus there.

## Required learning-entry fields

Every new learning entry must use this shape:

```markdown
### Learning entry — YYYY-MM-DD — Topic name

#### Date

#### Subject and topic

#### Source or activity

#### What I knew or assumed before

#### What I learned

#### Evidence, example, or application

#### My explanation now

#### Question or uncertainty

#### Mistake or confusion

#### Correction

#### Confidence

#### Progress

#### Next focus
```

Use the fields that are relevant to the session, but do not invent a separate structural system for a subject. Subject-specific material belongs inside the field content.

## Prohibited Journal content

Do not add these to learning Journals:

- `Long-term learning goals`;
- `Unit learning goals`;
- hypothetical future-goal lists such as “完成这一阶段后，我应该能够”;
- Stage-based roadmaps or course-plan instructions;
- repeated study-method explanations;
- duplicate vocabulary, review, or progress sections;
- top-level course-alignment, lesson-preview, or assignment-instruction sections outside `Learning entries`;
- content outside the approved overview or Unit structure.

When an existing learning record contains useful knowledge in an old section, preserve the knowledge by placing it inside a standard learning entry or the appropriate approved summary section. Remove the old structural wrapper.

## Update workflow

1. Read `Journal Template.md` and this file.
2. Identify whether the change belongs in the subject overview or a Unit Journal.
3. Add detailed real-time learning information to the Unit Journal first.
4. Update the overview only when the Unit status, current focus, cross-Unit question, or recurring mistake changes.
5. Run `bash scripts/validate-journals.sh`.
6. Run `git diff --check`.
7. Report exact validation results and any skipped runtime or publication checks.
