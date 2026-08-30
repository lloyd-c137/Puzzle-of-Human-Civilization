---
layout: default
title: Statistics Units 3, 6, and 7 Learning Journal
permalink: /math/statistics-units-3-6-7-journal/
section: Mathematics
summary: Real-time learning record for Statistics Units 3, 6, and 7.
journal_type: unit_learning_journal
learning_platform: khan-academy
subject: Mathematics
unit: Statistics Units 3, 6, and 7
---

# Statistics Units 3, 6, and 7 Learning Journal

## Unit purpose

记录 AP Statistics Unit 3（Summary statistics）、Unit 6（Collecting data）和 Unit 7（Probability）的实际学习过程。

## Progress dashboard

| Topic | Last updated | Next step |
| --- | --- | --- |
| Unit 3: Summary statistics | 2026-08-30 | Begin with mean, median, IQR, and standard deviation practice. |
| Unit 6: Collecting data | 2026-08-26 | No study record yet. |
| Unit 7: Probability | 2026-08-26 | No study record yet. |

## Key knowledge and vocabulary

| Concept or term | My current explanation | Example or connection |
| --- | --- | --- |
| Mean, median, and mode | Mean is the average, median is the middle ordered value, and mode is the most frequent value. | In the coffee dot plot, median is at 3 cups and mean is about 2.33 cups. |
| IQR and standard deviation | IQR describes the middle 50%; standard deviation describes typical distance from the mean. | IQR is (Q_3-Q_1); standard deviation uses the original data units. |
| Linear transformations | Adding a constant shifts center but not spread; multiplying scales center and spread. | Adding (c) to every value leaves IQR unchanged. |
| Box plots and outliers | A box plot summarizes five-number information; an outlier is unusually far from the main data. | The box is from (Q_1) to (Q_3), with a median line inside. |
| Collecting data | Not yet recorded. | Unit 6 topic. |
| Probability | Not yet recorded. | Unit 7 topic. |

## Learning records

### Learning record — 2026-08-26 — Unit 3 summary-statistics video map

#### question

now we need to study Unit 3: Exploring one-variable quantitative data: Summary statistics Unit 6: Collecting data Unit 7: Probability

#### respond

Khan Academy lesson page: “Unit 3: Exploring one-variable quantitative data: Summary statistics.” The current page listed 19 videos across measuring center, spread, transformations, standard deviation, and box plots.

- Mean 是所有观测值的总和除以观测数；median 是排序后的中间位置；mode 是出现次数最多的值。
- 在 histogram 中找 median 时，要按频数累计定位 50% 的位置，通常只能找到所在区间。
- 已知 mean 时，数据总和等于 (n\times\text{mean})，可用总和减去已知值求 missing value。
- 增加或删除 outlier 时，mean 通常比 median 改变得更明显。
- IQR 是 (Q_3-Q_1)，表示中间 50% 数据的 spread；standard deviation 表示数据偏离 mean 的典型程度。
- 对每个数据加同一个数，会让 mean、median、quartiles 一起平移，spread 不变；乘以正数会按相同倍数改变中心和 spread。
- 分布大致对称且没有明显 outlier 时，mean 和 standard deviation 更合适；偏斜或有 outlier 时，median 和 IQR 更稳健。
- Box plot 显示 minimum、(Q_1)、median、(Q_3)、maximum；方框表示中间 50%。
- optional videos 解释为什么样本 variance 使用 (n-1)，以及 simulation 如何显示 (n-1) 能减少低估 bias。

视频顺序形成一条完整链条：先用 mean/median/mode 描述 center，再用 IQR/variance/standard deviation 描述 spread，接着观察数据变换如何影响统计量，最后用 box plot 和 outlier 规则概括分布。一个具体关系是：

$$
IQR=Q_3-Q_1
$$

若原数据每个值都加 (c)，则 mean、median、(Q_1)、(Q_3) 都加 (c)，但 IQR 不变。

Summary statistics 用少量数字概括一组定量数据。先判断分布是否偏斜或有 outlier，再决定用 mean/standard deviation 还是 median/IQR；不能只报一个数字而不说明变量、单位和数据情境。

Variance 是 squared deviations 的平均量，单位是原单位的平方；standard deviation 是 variance 的平方根，回到原单位。IQR 只使用 (Q_1) 和 (Q_3)，不受最小值和最大值直接决定。

#### reflection

本次主要是视频内容整理，尚未完成对应练习。容易混淆的点是把 variance 和 standard deviation 当成同一个量，以及忘记 IQR 只描述中间 50%。

能说出各统计量的功能和主要公式，但还需要通过练习确认计算和选择。下一步从 mean、median、IQR、standard deviation 和 box plot 的计算与比较题开始。
### Learning record — 2026-08-26 — Estimating mean and median from a dot plot

#### question

i already found the mean,i dont understand the second question

#### respond

Khan Academy practice: Eloise’s coffee consumption over 15 workdays.

- 15 个观测值的 median 是排序后的第 8 个值。
- mean 要把所有观测值的总和除以 15；每个 dot 都要计入，不能只看最高的一堆。
- 3 cups 的数据最多，所以 median 在 3 cups 附近；较低的 0、1、2 cups 会把 mean 从 3 向左拉。
- 这张图中 median 的近似位置是 C，mean 的近似位置是 B。

Dot plot 中 0 cups 有 1 天、1 cup 有 2 天、2 cups 有 3 天、3 cups 有 9 天，共 15 天：

$$
\text{mean}=\frac{0(1)+1(2)+2(3)+3(9)}{15}=\frac{35}{15}\approx2.33
$$

第 8 个排序值是 3，因此 median 为 3。2.33 更接近 B，而 3 对应 C。

Median 是位置概念：找中间的观测值。Mean 是平衡点：所有 dot 都影响它，低值会把它拉低，高值会把它拉高。最高的 dot stack 不一定就是 mean。

不能只看频数最高的位置；先用每个横坐标的 frequency 做加权总和，再除以观测数。低值使 mean 约为 2.33，因此它在 B，而不是 C。

#### reflection

一开始不理解第二个问题，以为 mean 应该在最多 dots 的 3 cups 处，或者不清楚如何从图上“定位” mean。

已能解释 dot plot 中 mean 和 median 的不同，并完成这道题的判断。下一步用不同偏态和离群值的 dot plots 比较 mean 与 median。

### Learning record — 2026-08-30 — Starting Units 3, 6, and 7

#### question

now lets study :Khan Academy - Foundation  Unit 3: Exploring one-variable quantitative data: Summary statistics Unit 6: Collecting data Unit 7: Probability

#### respond

This study session covers three connected areas: Unit 3 summarizes one-variable quantitative data with measures such as mean, median, IQR, and standard deviation; Unit 6 examines how data are collected through samples, surveys, and experiments; Unit 7 describes uncertainty with probability. We will begin with one small Unit 3 retrieval question before moving between units: which feels most familiar right now—mean/median, sampling methods, or basic probability?

#### reflection

The learner has already worked with mean, median, IQR, dot plots, histograms, box plots, distribution shape, and outliers. The current request adds Unit 6 and Unit 7, but there is no new attempt yet in this session, so current mastery for those units is unknown. The next intervention is a short retrieval question, followed by step-by-step teaching based on the learner’s answer.
## Concepts to revisit

- Unit 3 中 mean/median、IQR/standard deviation 的选择；
- (n-1) 对 sample variance 的作用；
- histogram 中只能估计而不能读出精确统计量的情况；
- 从 dot plot 用 frequency 加权估计 mean。

## Mistakes and corrections

| Date | Topic | Mistake | Correction |
|---|---|---|---|
| 2026-08-26 | Unit 3 summary statistics | 容易把 variance 和 standard deviation 当成同一个量。 | Variance 的单位平方，standard deviation 是 variance 的平方根，单位回到原单位。 |
| 2026-08-26 | Mean from a dot plot | 以为 mean 就在最高的 dot stack 处。 | mean 使用所有观测值；先计算加权总和再除以总数。 |
