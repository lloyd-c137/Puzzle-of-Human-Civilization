# PHC Journal Rules

These rules apply to all learning-journal work in this repository.

## Before editing

Read `/Journal Template.md` before creating or editing a learning Journal.
Treat the template and this file as the source of truth for Journal structure.

LearningOS uses two Journal classes:

- `journal_type: unit_learning_journal` — a Unit Journal explicitly tied to Khan Academy; it must include `learning_platform: khan-academy` and `unit`.
- `journal_type: learning_journal` — a general Journal not tied to Khan Academy; it must include `learning_platform: independent`.

The four subject overview Journals are `learning_journal` files with
`journal_scope: overview`:

- `Math/Math Learning Journal.md`
- `Bio/Biology Learning Journal.md`
- `Chem Journal/Chemical Foundations learning journey.md`
- `Phy/Physics Learning Journal.md`

Specialized experiment or assignment records without one of the two Journal
types are not learning Journals and must not be forced into this format.

## Required overview structure

Each subject has one overview Journal. Its top-level sections must be:

- `Purpose`
- `Current overview`
- `Unit journals`
- `Current learning focus`
- `Recurring mistakes`
- `Recent progress`

The overview records status and navigation only. Do not duplicate complete learning entries from Unit Journals in it.

Biology-specific rule: Biology questions belong in the relevant learning
record's `question` field.

## Required Unit Learning Journal structure

Each Unit Journal must use these top-level sections:

- `Unit purpose`
- `Progress dashboard`
- `Key knowledge and vocabulary`
- `Learning records`
- `Concepts to revisit`
- `Mistakes and corrections`

Detailed learning records belong under `Learning records`.

## Required learning-record fields

Every new learning record must use exactly these three fields:

```markdown
### Learning record — YYYY-MM-DD — Topic name

#### question

Copy the learner's original words exactly as written, including questions,
doubts, predictions, answers, spelling, punctuation, and line breaks. Do not
summarize, translate, normalize, or rewrite them. If the original wording
cannot be verified from a source, leave this field empty rather than guessing.
Only the learner's original message belongs in this field. If a record was
initiated by an AI prompt and no learner question is available, leave this
field empty; do not copy the AI prompt into `question`.

#### respond

Summarize the response. It may be the AI response or the learner's answer
when the AI asked the question.

#### reflection

AI's learner-side reflection: exposed problems, current understanding,
uncertainty, mastery estimate, and next intervention.
```

Do not add Date, Source, Confidence, Progress, Review, or separate Question
fields to a learning record. Preserve useful historical content inside one of
the three fields instead of inventing a fourth field.

## Prohibited Journal content

Do not add these to learning Journals:

- `Long-term learning goals`;
- `Unit learning goals`;
- hypothetical future-goal lists such as “完成这一阶段后，我应该能够”;
- Stage-based roadmaps or course-plan instructions;
- repeated study-method explanations;
- duplicate vocabulary, review, or progress sections;
- `Questions carried across units`, `Questions I am carrying forward`, `Recent reviews`, or `Review record`;
- top-level course-alignment, lesson-preview, or assignment-instruction sections outside `Learning records`;
- content outside the approved overview or Unit structure.

When an existing learning record contains useful knowledge in an old section, preserve the knowledge by placing it inside one of the three standard fields. Remove the old structural wrapper.

## Update workflow

1. Read `Journal Template.md` and this file.
2. Identify whether the change belongs in a `unit_learning_journal` or a `learning_journal`.
3. Add the real-time learning record to the appropriate Journal.
4. Update an overview only when status, current focus, or recurring mistakes change.
5. Run `bash scripts/validate-journals.sh`.
6. Report exact validation results and any skipped runtime or publication checks. Exact learner-message whitespace is preserved when needed.

## Khan Academy launch requirement

If the learner explicitly requests a Khan Academy course or Unit, use the
LearningOS intent route with the learner's original message, execute the
returned required `computer_use.open_in_app_browser` action with Computer Use
in the Codex sidebar, and acknowledge the verified URL before starting the
lesson. A Khan Unit must not be treated as started, and its Journal must not be
written, until the Host Action acknowledgement succeeds. If the action cannot
be executed, stop the Khan flow and state the technical block instead of
turning the request into a conversation-only lesson.

For a full structured Lesson request, create an independent Lesson Journal
named for that Lesson rather than appending it to a subject overview or Unit
Journal. If `Check Out Questions` appears in the source, preserve every exact
question at the bottom under `checkoutquestions:`. Put an `answer:` line
immediately after each question and copy the learner's original answer there
after submission, without rewriting it.
