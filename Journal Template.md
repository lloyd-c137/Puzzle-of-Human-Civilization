# Journal Template

This is the shared format for all PHC subject and unit journals.

## How the structure works

- Each subject has one **learning journal** overview. It records Unit links, current focus, and recurring mistakes.
- A Khan Academy-bound Unit uses a **unit learning journal**. Other learning uses a general **learning journal**.
- Add the detailed record to the Unit journal first. Update the subject overview only when the Unit status or overall focus changes.

## Overview journal front matter

```yaml
---
layout: default
title: Subject Learning Journal
permalink: /subject/learning-journal/
section: Subject
summary: Overview of subject learning progress and Unit journals.
journal_type: learning_journal
learning_platform: independent
journal_scope: overview
subject: Subject
---
```

## Overview journal body

```markdown
# Subject Learning Journal

## Purpose

## Current overview

## Unit journals

| Unit | Main topics | Last updated | Journal |
| --- | --- | --- | --- |
|  |  |  |  |

## Current learning focus

- 

## Recurring mistakes

| Topic | Recurring mistake | Current correction |
|---|---|---|
|  |  |  |

## Recent progress

| Date | Unit | Topic | Next step |
| --- | --- | --- | --- |
|  |  |  |  |
```

## Unit journal front matter

```yaml
---
layout: default
title: Subject Unit Learning Journal
permalink: /subject/unit-journal/
section: Subject
summary: Real-time learning record for this Unit.
journal_type: unit_learning_journal
learning_platform: khan-academy
subject: Subject
unit: Unit name
---
```

## Unit journal body

```markdown
# Subject Unit Learning Journal

## Unit purpose

## Progress dashboard

| Topic | Last updated | Next step |
| --- | --- | --- |
|  |  |  |

## Key knowledge and vocabulary

| Concept or term | My current explanation | Example or connection |
| --- | --- | --- |
|  |  |  |

## Learning records

### Learning record — YYYY-MM-DD — Topic name

#### question

Copy the original learner wording exactly, including spelling, punctuation, and
line breaks. Do not summarize, translate, normalize, or rewrite it. If the
original wording cannot be verified, leave this field empty. Do not copy an AI
prompt into this field.

#### respond

Summary of the response. It may summarize the AI response or the learner's
answer when the AI asked the question.

#### reflection

AI's reflection about exposed problems, current understanding, uncertainty,
mastery estimate, and next intervention.

Every learning record has exactly these three fields: `question`, `respond`, and
`reflection`. Do not add status, difficulty, confidence, source, activity, or
other subfields inside a record. Status labels such as `High`, `Medium`,
`Exploring`, `Applied`, and `Not started` are not journal fields; use the
learning record and the Runtime state as the evidence instead.

## Concepts to revisit

- 

## Mistakes and corrections

| Date | Topic | Mistake | Correction |
|---|---|---|---|
|  |  |  |  |

```
