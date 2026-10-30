---
layout: default
title: Statistics Units 8 and 9 Learning Journal
permalink: /math/statistics-units-8-9-journal/
section: Mathematics
summary: Real-time learning record for Statistics Units 8 and 9.
journal_type: unit_learning_journal
learning_platform: khan-academy
subject: Mathematics
unit: Statistics Units 8 and 9
---

# Statistics Units 8 and 9 Learning Journal

## Progress dashboard

| Topic | Last updated | Next step |
| --- | --- | --- |
| Unit 8: Random variables and probability distributions | 2026-09-07 | Review the formulas without assistance; Khan Unit mastery is 100%, while quizzes and the unit test remain unattempted. |
| Unit 9: Sampling distributions | 2026-09-07 | Review standard errors, independence, and paired-data cautions; Khan Unit mastery is 100%, while quizzes and the unit test remain unattempted. |

## Key knowledge and vocabulary

| Concept or term | My current explanation | Example or connection |
| --- | --- | --- |
| Random variable | A variable whose value is determined by a random outcome. | (X) can be the number of heads in three coin flips. |
| Discrete random variable | A random variable that takes separate countable values. | The number of heads can be 0, 1, 2, or 3, but not 1.5. |
| Probability distribution | A list, table, or graph showing each possible value and its probability. | For three fair coin flips, (P(X=0)=1/8), (P(X=1)=3/8), (P(X=2)=3/8), and (P(X=3)=1/8). |
| Valid probability distribution | Every probability is nonnegative, and all probabilities add to 1. | A model totaling 0.8 or 1.1 is invalid. |
| Theoretical probability | Probability calculated from equally likely outcomes or a probability model. | Two 3-sided dice produce 9 equally likely ordered outcomes. |
| Independent events | One event does not change the probability of the other. | Getting a free dessert on one restaurant visit does not change the probability on the next visit. |
| Expected value | The long-run mean of a random variable: add each value multiplied by its probability. | (E(X)=\sum xP(X=x)). |
| Standard deviation of a discrete random variable | The typical distance from the expected value, weighted by the probabilities. | ​(\sigma_X=\sqrt{\sum (x-\mu_X)^2P(X=x)}\). |
| Linear transformation | Adding (b) shifts the mean; multiplying by (a) scales the mean and standard deviation. | (E(aX+b)=aE(X)+b), and (SD(aX+b)=|a|SD(X)). |
| Binomial random variable | Counts successes in a fixed number of independent trials with the same success probability. | (P(X=k)=\binom nkp^k(1-p)^{n-k}). |
| Geometric random variable | Counts trials until the first success. | (P(X=k)=(1-p)^{k-1}p), for (k=1,2,\ldots). |
| Cumulative geometric probability | “At most” uses the complement of failing through the cutoff; “greater than” is the probability of all failures through the cutoff. | (P(X\le k)=1-(1-p)^k), (P(X>k)=(1-p)^k). |
| Sampling distribution | The distribution of a statistic across every possible sample of a fixed size from a population. | A sample mean has its own center and standard error. |
| Central limit theorem | For sufficiently large samples, the sampling distribution of a sample mean is approximately normal even when the population is not normal. | The center is ​(\mu\), and (SD(\bar X)=\sigma/\sqrt n\). |
| Unbiased estimator | An estimator is unbiased when the mean of its sampling distribution equals the population parameter. | ​(E(\hat p)=p\) for a sample proportion. |
| Sample proportion | The sample proportion is centered at (p), with standard deviation ​(\sqrt{p(1-p)/n}\) when the sampling conditions hold. | Check the success-failure condition before using a normal model. |
| Difference of sample proportions | For independent samples, subtract the centers and add the two variance terms. | ​(\mu_{\hat p_1-\hat p_2}=p_1-p_2\). |
| Difference of sample means | For independent samples, subtract the means and add the two variance terms. | ​(\mu_{\bar X_1-\bar X_2}=\mu_1-\mu_2\), (\sigma=\sqrt{\sigma_1^2/n_1+\sigma_2^2/n_2}\). |
| Paired measurements | Two measurements from the same people are not independent samples just because the people were randomly sampled. | High-school GPA and university GPA for the same students form paired data. |

## Learning records

### Learning record — 2026-09-02 — Introduction to random variables and probability distributions

#### question

interpret all videos and articles of the current lesson for me

#### respond

The live Khan Academy page is Unit 8, Lesson 1: “Introduction to random variables and probability distributions.” It contains five videos and three exercises; no article is currently listed.

1. **Constructing a probability distribution for a random variable**: Define (X) as the number of heads in three flips of a fair coin. There are 8 equally likely outcomes. The probabilities are (P(X=0)=1/8), (P(X=1)=3/8), (P(X=2)=3/8), and (P(X=3)=1/8). A discrete probability distribution lists the possible values of (X) and how likely each one is.

2. **Valid discrete probability distribution examples**: A probability model is valid only when every probability is at least 0 and the probabilities add to 1. A basketball example totals 0.8, so it is invalid. In the chicken, cow, and human example, each creature is equally likely to be selected, so each category’s probability is its count divided by the total count; the probabilities add to 1.

3. **Probability with a discrete random variable example**: Hugo buys baseball-card packs until he gets the card he wants, but he must stop after four packs. The probability of buying at least two packs is the combined probability of buying 2, 3, or 4 packs. It can be found by the complement: (1-P(X=1)=1-0.2=0.8). Because he must stop at four packs, the probability of exactly four packs includes the case where he still has not found the card by the fourth pack.

4. **Theoretical probability distribution example: tables**: For two 3-sided dice, make a (3\times3) table of the 9 equally likely ordered outcomes. If (D) is the nonnegative difference, then (D) can be 0, 1, or 2. The probabilities are (P(D=0)=3/9=1/3), (P(D=1)=4/9), and (P(D=2)=2/9).

5. **Theoretical probability distribution example: multiplication**: Kai visits a restaurant twice, with a (1/5) chance of receiving a free dessert each time. The two visits are independent. For (X), the number of free desserts, (P(X=0)=(4/5)(4/5)=16/25), (P(X=1)=2(4/5)(1/5)=8/25), and (P(X=2)=(1/5)(1/5)=1/25). The factor 2 appears because there are two ways to receive exactly one dessert.

The three exercises practice graphing probability distributions, finding probabilities from a discrete distribution, and constructing theoretical probability distributions. The central check is: probabilities cannot be negative, and their total must equal 1.

#### reflection
这次记录把“interpret all videos and articles of the current lesson for me”留下了一个可以继续检查的节点。这条记录是当前 Journal 中较早的一次记录，暂时没有更早的同类条目可比较。本条记录中写到：The live Khan Academy page is Unit 8, Lesson 1: “Introduction to random variables and probability distributions.” It contains five videos and three exercises; no article is currently listed…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“interpret all videos and articles of the current lesson for me”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-04 — Valid probability distribution rules

#### question

what is no negative probabilities and probabilities adding to 1

#### respond

“No negative probabilities” means every probability must be 0 or greater. A probability cannot be (-0.2), because a chance cannot be less than zero. “Probabilities adding to 1” means that the probabilities of all possible outcomes together equal 1, or 100%.

For a fair die, the six probabilities are each (1/6), and they add to (6/6=1). A model with probabilities (0.2), (0.5), and (0.1) adds to (0.8), so it accounts for only 80% of the possible outcomes and is invalid. A total of (1.2) would also be invalid because it claims 120% total probability.

#### reflection
这次记录把“what is no negative probabilities and probabilities adding to 1”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-02 — Introduction to random variables and p…”，当时记录的是“The live Khan Academy page is Unit 8, Lesson 1: “Introduction to random variables and pro…”。本条记录中写到：“No negative probabilities” means every probability must be 0 or greater. A probability cannot be (-0.2), because a chance cannot be less than zero. “Probabilities adding to 1” means that t…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“what is no negative probabilities and probabilities adding to 1”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-04 — Checking both probability-distribution rules

#### question

0.3,0.4,0.3 are vaild,but 0.3,0.4,-0.1,0.4 are invaild because there are negative probability

#### respond

The learner correctly identified that (0.3,0.4,0.3) is valid and that (0.3,0.4,-0.1,0.4) is invalid because it contains a negative probability. The first set adds to 1 and has no negative value. The second set also adds to 1, but it still fails the nonnegative-probability rule. A distribution must pass both rules. The next comparison is (0.2,0.5,0.4), which has no negative probability but adds to 1.1.

#### reflection
这次记录把“0.3,0.4,0.3 are vaild,but 0.3,0.4,-0.1,0.4 are invaild because there are negative probabi…”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-04 — Valid probability distribution rules”，当时记录的是““No negative probabilities” means every probability must be 0 or greater. A probability c…”。本条记录中写到：The learner correctly identified that (0.3,0.4,0.3) is valid and that (0.3,0.4,-0.1,0.4) is invalid because it contains a negative probability. The first set adds to 1 and has no negative v…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“0.3,0.4,0.3 are vaild,but 0.3,0.4,-0.1,0.4 are invaild because there are negative probability”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-04 — Checking whether probabilities total 1

#### question

0.2,0.5,0.4 are invaild,because their total sum is not 1

#### respond

The learner correctly identified that (0.2,0.5,0.4) is invalid because (0.2+0.5+0.4=1.1), or 110%. All individual probabilities are nonnegative, but the total is greater than 1, so the distribution fails the second rule. A probability of 0 is allowed because it means the outcome is impossible.

#### reflection
这次记录把“0.2,0.5,0.4 are invaild,because their total sum is not 1”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-04 — Checking both probability-distribution…”，当时记录的是“The learner correctly identified that (0.3,0.4,0.3) is valid and that (0.3,0.4,-0.1,0.4) …”。本条记录中写到：The learner correctly identified that (0.2,0.5,0.4) is invalid because (0.2+0.5+0.4=1.1), or 110%. All individual probabilities are nonnegative, but the total is greater than 1, so the dist…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“0.2,0.5,0.4 are invaild,because their total sum is not 1”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-04 — Zero probability is allowed

#### question

0.5,0.5,0 is a vaild probality distribution because their total sum is 1

#### respond

The learner correctly identified that (0.5,0.5,0) is valid. The probabilities add to (1), none is negative, and the (0) is allowed because it means that outcome is impossible. The two validity checks are therefore both satisfied.

#### reflection
这次记录把“0.5,0.5,0 is a vaild probality distribution because their total sum is 1”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-04 — Checking whether probabilities total 1”，当时记录的是“The learner correctly identified that (0.2,0.5,0.4) is invalid because (0.2+0.5+0.4=1.1),…”。本条记录中写到：The learner correctly identified that (0.5,0.5,0) is valid. The probabilities add to (1), none is negative, and the (0) is allowed because it means that outcome is impossible. The two valid…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“0.5,0.5,0 is a vaild probality distribution because their total sum is 1”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-04 — Explaining why probabilities add to 1

#### question

every probability is at least 0,there is no negative probability because the probability can not be negative,all probabilities add to 1 because they represent the probability distribution

#### respond

The learner correctly explained that probabilities cannot be negative. The explanation of the total needed one refinement: all possible outcomes together cover 100% of what can happen, so their probabilities must add to (1). For example, a die must land on one of 1 through 6, so those six probabilities account for the complete outcome space.

#### reflection
这次记录把“every probability is at least 0,there is no negative probability because the probability …”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-04 — Zero probability is allowed”，当时记录的是“The learner correctly identified that (0.5,0.5,0) is valid. The probabilities add to (1),…”。本条记录中写到：The learner correctly explained that probabilities cannot be negative. The explanation of the total needed one refinement: all possible outcomes together cover 100% of what can happen, so t…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“every probability is at least 0,there is no negative probability because the probability can not be negative,all probab…”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-04 — Valid distribution with probabilities totaling 1

#### question

\\(0.2+0.3+0.5=1\\) vaild

#### respond

The learner correctly identified that the probabilities total 1, so the set is valid because each probability is nonnegative and the complete total is 100%. The explanation still needs to connect the total of 1 to all possible outcomes together covering everything that can happen.

#### reflection
这次记录把“\\(0.2+0.3+0.5=1\\) vaild”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-04 — Explaining why probabilities add to 1”，当时记录的是“The learner correctly explained that probabilities cannot be negative. The explanation of…”。本条记录中写到：The learner correctly identified that the probabilities total 1, so the set is valid because each probability is nonnegative and the complete total is 100%. The explanation still needs to c…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“\\(0.2+0.3+0.5=1\\) vaild”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-04 — Review of the current Unit 8 lesson

#### question

interpret all videos and articles of the current lesson for me

#### respond

The current Khan Academy lesson was checked live: Unit 8, Lesson 1, “Introduction to random variables and probability distributions.” It lists five videos and three exercises, with no article. The videos cover constructing a distribution from coin flips, the two validity rules, reading a distribution graph, Hugo’s limited four-pack example, counting outcomes with a table, and multiplying probabilities for independent visits. The central relationship is that a random variable records a possible numerical outcome, while a probability distribution assigns probabilities to those outcomes.

#### reflection
这次记录把“interpret all videos and articles of the current lesson for me”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-04 — Valid distribution with probabilities …”，当时记录的是“The learner correctly identified that the probabilities total 1, so the set is valid beca…”。本条记录中写到：The current Khan Academy lesson was checked live: Unit 8, Lesson 1, “Introduction to random variables and probability distributions.” It lists five videos and three exercises, with no artic…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“interpret all videos and articles of the current lesson for me”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-07 — Starting Unit 8 and Unit 9 exercise practice

#### question

现在请按照之前做生物时的一样的要求来完成Khan Academy - Advanced： Unit 8: Random variables and probability distributions Unit 9: Sampling distributions

#### respond

The live Khan Academy work was completed in the Advanced classroom context using the AP®/College Statistics Unit 8 and Unit 9 pages. The session focused on practice exercises rather than quizzes or unit tests. Each submitted answer was separated by at least 20 seconds, and the browser state was checked after corrections.

Unit 8 covered probability distributions, expected value, standard deviation, transformations, combinations of random variables, binomial variables, and geometric variables. Unit 9 covered normal density curves, the central limit theorem, estimators, sample proportions, differences of sample proportions, sample means, and differences of sample means.

#### reflection
这次记录把“现在请按照之前做生物时的一样的要求来完成Khan Academy - Advanced： Unit 8: Random variables and probability dis…”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-04 — Review of the current Unit 8 lesson”，当时记录的是“The current Khan Academy lesson was checked live: Unit 8, Lesson 1, “Introduction to rand…”。本条记录中写到：The live Khan Academy work was completed in the Advanced classroom context using the AP®/College Statistics Unit 8 and Unit 9 pages. The session focused on practice exercises rather than qu…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“现在请按照之前做生物时的一样的要求来完成Khan Academy - Advanced： Unit 8: Random variables and probability distributions Unit 9: Sampling di…”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-07 — Reading a theoretical probability distribution

#### question

AI-initiated Khan Academy practice record; no separate learner question was captured.

#### respond

The theoretical-probability exercises repeatedly required counting equally likely outcomes. For two spins of a spinner labeled 0, 1, 2, and 3, the non-negative difference (X) can be 0, 1, 2, or 3. Among the 16 ordered outcomes, the counts are 4, 6, 4, and 2, so the distribution is (4/16,6/16,4/16,2/16). For the sum of two spins, the possible values are 0 through 6, with counts (1,2,3,4,3,2,1).

The coin example used four fair coins. There are 16 equally likely outcomes, and the number of heads has probabilities (1/16,4/16,6/16,4/16,1/16), or (1/16,1/4,3/8,1/4,1/16). A table must include the complete support of the random variable and probabilities that add to 1.

#### reflection
这次记录把“AI-initiated Khan Academy practice record; no separate learner question was captured.”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-07 — Starting Unit 8 and Unit 9 exercise pr…”，当时记录的是“The live Khan Academy work was completed in the Advanced classroom context using the AP®/…”。本条记录中写到：The theoretical-probability exercises repeatedly required counting equally likely outcomes. For two spins of a spinner labeled 0, 1, 2, and 3, the non-negative difference (X) can be 0, 1, 2…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“AI-initiated Khan Academy practice record; no separate learner question was captured.”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-07 — Expected value, spread, and transformations of random variables

#### question

AI-initiated Khan Academy practice record; no separate learner question was captured.

#### respond

The Unit 8 practice set connected a probability table to its long-run average and spread. Expected value is the weighted mean (E(X)=\sum xP(X=x)). The discrete-random-variable standard deviation weights each squared distance from the mean by (P(X=x)), then takes the square root. Adding a constant changes the center but not the spread; multiplying by a constant changes the standard deviation by the absolute value of that constant.

For independent random variables, means combine linearly: (E(X+Y)=E(X)+E(Y)) and (E(X-Y)=E(X)-E(Y)). Variances add for both sums and differences, so the sign in the difference does not make the variance terms cancel. These rules were applied in the combining-random-variables and combining-normal-random-variables exercises.

#### reflection
这次记录把“AI-initiated Khan Academy practice record; no separate learner question was captured.”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-07 — Reading a theoretical probability dist…”，当时记录的是“The theoretical-probability exercises repeatedly required counting equally likely outcome…”。本条记录中写到：The Unit 8 practice set connected a probability table to its long-run average and spread. Expected value is the weighted mean (E(X)=\sum xP(X=x)). The discrete-random-variable standard devi…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“AI-initiated Khan Academy practice record; no separate learner question was captured.”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-07 — Binomial versus geometric variables

#### question

AI-initiated Khan Academy practice record; no separate learner question was captured.

#### respond

The binomial exercises checked whether a situation has a fixed number of independent trials, two outcomes per trial, and a constant success probability. A binomial random variable counts successes in those (n) trials. The geometric exercises instead stop at the first success, so the random variable counts how many trials are needed.

For a geometric variable with success probability (p), the probability of the first success on trial (k) is ((1-p)^{k-1}p). For example, when a success probability is 0.40, (P(R\le2)=1-0.60^2=0.64). When the question asks for more than 10 scans before a 5% misread, the required probability is (P(B>10)=0.95^{10}\approx0.60).

#### reflection
这次记录把“AI-initiated Khan Academy practice record; no separate learner question was captured.”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-07 — Expected value, spread, and transforma…”，当时记录的是“The Unit 8 practice set connected a probability table to its long-run average and spread.…”。本条记录中写到：The binomial exercises checked whether a situation has a fixed number of independent trials, two outcomes per trial, and a constant success probability. A binomial random variable counts su…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“AI-initiated Khan Academy practice record; no separate learner question was captured.”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-07 — Natural correction in theoretical probability

#### question

AI-initiated Khan Academy practice record; no separate learner question was captured.

#### respond

In the four-fair-coin theoretical-distribution exercise, the first selected table used (1/8,1/4,3/8,1/4,1/8). That denominator does not match the 16 equally likely outcomes from four coin flips. After counting the sample-space rows, the answer was corrected to (1/16,1/4,3/8,1/4,1/16), and Khan marked the corrected choice as correct.

In the spinner-difference exercise, the first pass also treated the table layout incorrectly. The corrected table used (X=0,1,2,3) with (4/16,6/16,4/16,2/16). A second pass then answered the same kind of theoretical-distribution questions correctly.

#### reflection
这次记录把“AI-initiated Khan Academy practice record; no separate learner question was captured.”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-07 — Binomial versus geometric variables”，当时记录的是“The binomial exercises checked whether a situation has a fixed number of independent tria…”。本条记录中写到：In the four-fair-coin theoretical-distribution exercise, the first selected table used (1/8,1/4,3/8,1/4,1/8). That denominator does not match the 16 equally likely outcomes from four coin f…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“AI-initiated Khan Academy practice record; no separate learner question was captured.”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-07 — Normal density curves and sampling distributions

#### question

AI-initiated Khan Academy practice record; no separate learner question was captured.

#### respond

Unit 9 began with the idea that probability in a continuous normal model is represented by area under the density curve. The sampling-distribution exercises then treated a statistic, not an individual observation, as the random variable. A sampling distribution describes the values a statistic would produce over repeated samples of the same size.

For sample means, the center is the population mean ​(\mu_{\bar X}=\mu\), and the standard deviation is the standard error ​(\sigma_{\bar X}=\sigma/\sqrt n\). The central limit theorem supports an approximately normal model for sufficiently large samples. The exercises for normal density curves and sample means/central limit theorem were completed 4/4.

#### reflection
这次记录把“AI-initiated Khan Academy practice record; no separate learner question was captured.”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-07 — Natural correction in theoretical prob…”，当时记录的是“In the four-fair-coin theoretical-distribution exercise, the first selected table used (1…”。本条记录中写到：Unit 9 began with the idea that probability in a continuous normal model is represented by area under the density curve. The sampling-distribution exercises then treated a statistic, not an…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“AI-initiated Khan Academy practice record; no separate learner question was captured.”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-07 — Estimators and sample proportions

#### question

AI-initiated Khan Academy practice record; no separate learner question was captured.

#### respond

An estimator is a statistic used to estimate a population parameter. It is unbiased when its sampling distribution is centered at the parameter. For a sample proportion, the center is (p), and the standard deviation is ​(\sqrt{p(1-p)/n}\). Before using a normal approximation, check the success-failure condition so that both expected counts are sufficiently large.

For two independent sample proportions, the difference has center (p_1-p_2). Its standard error uses both variance terms:

\[
\sqrt{\frac{p_1(1-p_1)}{n_1}+\frac{p_2(1-p_2)}{n_2}}.
\]

The practice sets for biased/unbiased estimators, the normal condition, mean and standard deviation of sample proportions, probabilities with sample proportions, and differences in sample proportions were each completed 4/4.

#### reflection
这次记录把“AI-initiated Khan Academy practice record; no separate learner question was captured.”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-07 — Normal density curves and sampling dis…”，当时记录的是“Unit 9 began with the idea that probability in a continuous normal model is represented b…”。本条记录中写到：An estimator is a statistic used to estimate a population parameter. It is unbiased when its sampling distribution is centered at the parameter. For a sample proportion, the center is (p), …。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“AI-initiated Khan Academy practice record; no separate learner question was captured.”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-07 — Sample means and differences of sample means

#### question

AI-initiated Khan Academy practice record; no separate learner question was captured.

#### respond

For an independent difference of sample means, subtract the population means for the center and add the two variance terms for the standard error:

\[
\mu_{\bar X_1-\bar X_2}=\mu_1-\mu_2,
\qquad
\sigma_{\bar X_1-\bar X_2}=\sqrt{\frac{\sigma_1^2}{n_1}+\frac{\sigma_2^2}{n_2}}.
\]

The sample-means exercises covered the mean and standard deviation of one sample mean, probabilities involving a sample mean, the mean and standard deviation of a difference, and the shape of the difference distribution. Each displayed practice set finished with 4/4 correct.

#### reflection
这次记录把“AI-initiated Khan Academy practice record; no separate learner question was captured.”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-07 — Estimators and sample proportions”，当时记录的是“An estimator is a statistic used to estimate a population parameter. It is unbiased when …”。本条记录中写到：For an independent difference of sample means, subtract the population means for the center and add the two variance terms for the standard error: \[ \mu_{\bar X_1-\bar X_2}=\mu_1-\mu_2, \q…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“AI-initiated Khan Academy practice record; no separate learner question was captured.”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-07 — Paired measurements and independence

#### question

AI-initiated Khan Academy practice record; no separate learner question was captured.

#### respond

The International University exercise compared each student’s high-school GPA with that same student’s university GPA. Even though the 80 freshmen were selected by an SRS from 900 students, the two GPA measurements are paired within each person. Therefore the two samples are not independent, and the independent-samples standard-deviation formula is not appropriate without accounting for the pairing.

The correct choice was that the samples are not independent of each other. The 10% condition (80/900\approx8.9\%<10\%) can justify treating sampled students as independent observations for the sampling process, but it does not turn two variables measured on the same student into independent samples.

#### reflection
这次记录把“AI-initiated Khan Academy practice record; no separate learner question was captured.”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-07 — Sample means and differences of sample…”，当时记录的是“For an independent difference of sample means, subtract the population means for the cent…”。本条记录中写到：The International University exercise compared each student’s high-school GPA with that same student’s university GPA. Even though the 80 freshmen were selected by an SRS from 900 students,…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“AI-initiated Khan Academy practice record; no separate learner question was captured.”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-07 — Final Khan Academy verification

#### question

AI-initiated Khan Academy practice record; no separate learner question was captured.

#### respond

The Unit 8 page displayed “Unit mastery: 100%” and every listed skill as proficient, including theoretical probabilities and cumulative geometric probability. The Unit 9 page displayed “Unit mastery: 100%” and every listed practice skill as proficient, including mean and standard deviation of difference of sample means.

The completed practice scope was 17 Unit 8 exercise sets and 12 Unit 9 exercise sets, with the relevant exercise screens reaching 4/4. Quizzes and unit tests remain outside this record because they were not attempted.

#### reflection
这次记录把“AI-initiated Khan Academy practice record; no separate learner question was captured.”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-07 — Paired measurements and independence”，当时记录的是“The International University exercise compared each student’s high-school GPA with that s…”。本条记录中写到：The Unit 8 page displayed “Unit mastery: 100%” and every listed skill as proficient, including theoretical probabilities and cumulative geometric probability. The Unit 9 page displayed “Uni…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“AI-initiated Khan Academy practice record; no separate learner question was captured.”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-07 — Review: why probabilities cannot be negative

#### question

what is no negative probabilities and probabilities adding to 1

#### respond

“No negative probabilities” means every probability is at least 0. A probability such as ​(-0.2) cannot describe a chance. “Probabilities adding to 1” means that all possible outcomes together account for 100% of what can happen. Both conditions must be checked: a list can add to 1 and still be invalid if one entry is negative, and all nonnegative entries can still be invalid if their total is not 1.

#### reflection
这次记录把“what is no negative probabilities and probabilities adding to 1”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-07 — Final Khan Academy verification”，当时记录的是“The Unit 8 page displayed “Unit mastery: 100%” and every listed skill as proficient, incl…”。本条记录中写到：“No negative probabilities” means every probability is at least 0. A probability such as ​(-0.2) cannot describe a chance. “Probabilities adding to 1” means that all possible outcomes toget…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“what is no negative probabilities and probabilities adding to 1”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-07 — Review: checking a distribution with a negative value

#### question

0.3,0.4,0.3 are vaild,but 0.3,0.4,-0.1,0.4 are invaild because there are negative probability

#### respond

The first set is valid because its probabilities are nonnegative and (0.3+0.4+0.3=1). The second set is invalid because it contains (-0.1), even though (0.3+0.4-0.1+0.4=1). A total of 1 is necessary but not sufficient; every individual probability must also be at least 0.

#### reflection
这次记录把“0.3,0.4,0.3 are vaild,but 0.3,0.4,-0.1,0.4 are invaild because there are negative probabi…”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-07 — Review: why probabilities cannot be ne…”，当时记录的是““No negative probabilities” means every probability is at least 0. A probability such as …”。本条记录中写到：The first set is valid because its probabilities are nonnegative and (0.3+0.4+0.3=1). The second set is invalid because it contains (-0.1), even though (0.3+0.4-0.1+0.4=1). A total of 1 is …。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“0.3,0.4,0.3 are vaild,but 0.3,0.4,-0.1,0.4 are invaild because there are negative probability”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-07 — Review: a total greater than 1

#### question

0.2,0.5,0.4 are invaild,because their total sum is not 1

#### respond

The conclusion is correct: (0.2+0.5+0.4=1.1), so the list claims 110% total probability and cannot be a valid distribution. None of the individual values is negative, but the second validity rule still fails. In contrast, (0.5+0.5+0=1) is valid because zero is allowed.

#### reflection
这次记录把“0.2,0.5,0.4 are invaild,because their total sum is not 1”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-07 — Review: checking a distribution with a…”，当时记录的是“The first set is valid because its probabilities are nonnegative and (0.3+0.4+0.3=1). The…”。本条记录中写到：The conclusion is correct: (0.2+0.5+0.4=1.1), so the list claims 110% total probability and cannot be a valid distribution. None of the individual values is negative, but the second validit…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“0.2,0.5,0.4 are invaild,because their total sum is not 1”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-07 — Review: why a probability distribution totals 1

#### question

every probability is at least 0,there is no negative probability because the probability can not be negative,all probabilities add to 1 because they represent the probability distribution

#### respond

The first rule is explained correctly. The reason for the total needs one refinement: all possible outcomes together represent 100% of the chance process, so their probabilities must add to 1. For a fair die, the six equally likely outcomes each have probability (1/6), and (6(1/6)=1).

#### reflection
这次记录把“every probability is at least 0,there is no negative probability because the probability …”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-07 — Review: a total greater than 1”，当时记录的是“The conclusion is correct: (0.2+0.5+0.4=1.1), so the list claims 110% total probability a…”。本条记录中写到：The first rule is explained correctly. The reason for the total needs one refinement: all possible outcomes together represent 100% of the chance process, so their probabilities must add to…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“every probability is at least 0,there is no negative probability because the probability can not be negative,all probab…”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-07 — Review: theoretical probability and sample-space counting

#### question

\(0.2+0.3+0.5=1\) vaild

#### respond

The calculation is correct and all three values are nonnegative, so this is a valid probability list. In the later theoretical-probability exercises, the same check was combined with outcome counting. Four fair coins have (2^4=16) equally likely outcomes, not 8. Two spins of a 0–3 spinner have (4^2=16) ordered outcomes; the nonnegative difference has probabilities (4/16,6/16,4/16,2/16).

#### reflection
这次记录把“\(0.2+0.3+0.5=1\) vaild”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-07 — Review: why a probability distribution…”，当时记录的是“The first rule is explained correctly. The reason for the total needs one refinement: all…”。本条记录中写到：The calculation is correct and all three values are nonnegative, so this is a valid probability list. In the later theoretical-probability exercises, the same check was combined with outcom…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“\(0.2+0.3+0.5=1\) vaild”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-07 — Review: geometric probability wording

#### question

AI-initiated Khan Academy practice record; no separate learner question was captured.

#### respond

The geometric exercises required careful reading of the stopping rule. If (X) is the trial of the first success, then (P(X=k)=(1-p)^{k-1}p). “At most (k)” means the first success occurs by trial (k), so (P(X\le k)=1-(1-p)^k). “Greater than (k)” means the first (k) trials are all failures, so (P(X>k)=(1-p)^k). With a 5% misread rate, (P(B>10)=0.95^{10}\approx0.60).

#### reflection
这次记录把“AI-initiated Khan Academy practice record; no separate learner question was captured.”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-07 — Review: theoretical probability and sa…”，当时记录的是“The calculation is correct and all three values are nonnegative, so this is a valid proba…”。本条记录中写到：The geometric exercises required careful reading of the stopping rule. If (X) is the trial of the first success, then (P(X=k)=(1-p)^{k-1}p). “At most (k)” means the first success occurs by …。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“AI-initiated Khan Academy practice record; no separate learner question was captured.”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-07 — Review: sampling distribution and standard error

#### question

AI-initiated Khan Academy practice record; no separate learner question was captured.

#### respond

Unit 9 changed the object being described from an individual observation to a statistic across repeated samples. A sampling distribution shows the possible values of a statistic and how often they occur. For a sample mean, the center is (mu) and the standard error is (sigma/\sqrt n). The central limit theorem explains why the sample-mean distribution becomes approximately normal for sufficiently large samples.

#### reflection
这次记录把“AI-initiated Khan Academy practice record; no separate learner question was captured.”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-07 — Review: geometric probability wording”，当时记录的是“The geometric exercises required careful reading of the stopping rule. If (X) is the tria…”。本条记录中写到：Unit 9 changed the object being described from an individual observation to a statistic across repeated samples. A sampling distribution shows the possible values of a statistic and how oft…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“AI-initiated Khan Academy practice record; no separate learner question was captured.”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-07 — Review: sample proportions and normal conditions

#### question

AI-initiated Khan Academy practice record; no separate learner question was captured.

#### respond

For a sample proportion, the sampling distribution is centered at (p), with standard deviation ​(\sqrt{p(1-p)/n}) when the conditions support the model. Before using a normal approximation, check that the expected numbers of successes and failures are sufficiently large. For independent sample proportions, the difference is centered at (p_1-p_2), and the two variance terms are added in the standard error.

#### reflection
这次记录把“AI-initiated Khan Academy practice record; no separate learner question was captured.”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-07 — Review: sampling distribution and stan…”，当时记录的是“Unit 9 changed the object being described from an individual observation to a statistic a…”。本条记录中写到：For a sample proportion, the sampling distribution is centered at (p), with standard deviation ​(\sqrt{p(1-p)/n}) when the conditions support the model. Before using a normal approximation,…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“AI-initiated Khan Academy practice record; no separate learner question was captured.”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-07 — Review: difference of sample means

#### question

AI-initiated Khan Academy practice record; no separate learner question was captured.

#### respond

For independent samples, the mean of a difference is found in the stated order: (mu_1-mu_2). The standard error is based on the sum of the two variance terms:

\[
\sigma_{\bar X_1-\bar X_2}=\sqrt{\frac{\sigma_1^2}{n_1}+\frac{\sigma_2^2}{n_2}}.
\]

One live question displayed means 7.4 and 7.0. The first selected difference was 0.2, but the correct calculation is (7.4-7.0=0.4), and the answer was corrected to the 0.4 choice.

#### reflection
这次记录把“AI-initiated Khan Academy practice record; no separate learner question was captured.”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-07 — Review: sample proportions and normal …”，当时记录的是“For a sample proportion, the sampling distribution is centered at (p), with standard devi…”。本条记录中写到：For independent samples, the mean of a difference is found in the stated order: (mu_1-mu_2). The standard error is based on the sum of the two variance terms: \[ \sigma_{\bar X_1-\bar X_2}=…。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“AI-initiated Khan Academy practice record; no separate learner question was captured.”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。

### Learning record — 2026-09-07 — Review: independent groups versus paired measurements

#### question

AI-initiated Khan Academy practice record; no separate learner question was captured.

#### respond

The independent-samples formula is not appropriate when the two measurements come from the same people. In the university GPA example, each student contributes both a high-school GPA and a university GPA, so the measurements are paired. The fact that the 80 students were selected by an SRS from 900 students and that (80/900\approx8.9\%<10\%) does not make the two GPA variables independent.

#### reflection
这次记录把“AI-initiated Khan Academy practice record; no separate learner question was captured.”留下了一个可以继续检查的节点。回看前一条“Learning record — 2026-09-07 — Review: difference of sample means”，当时记录的是“For independent samples, the mean of a difference is found in the stated order: (mu_1-mu_…”。本条记录中写到：The independent-samples formula is not appropriate when the two measurements come from the same people. In the university GPA example, each student contributes both a high-school GPA and a …。这条记录目前没有找到可直接对应的结构化 Evidence，所以这里只依据 Journal 原文，不把结果说得比原记录更多。现在能不能算稳定，仍要看下一次独立回答，不能只因为看过解释或写过一次就下结论。下一次不看资料重新回答原问题“AI-initiated Khan Academy practice record; no separate learner question was captured.”，并补一个例子、计算或步骤；如果答不完整，就把缺的那一步单独记下来。
