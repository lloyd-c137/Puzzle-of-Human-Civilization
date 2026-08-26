---
layout: default
title: Statistics Units 3, 6, and 7 Learning Journal
permalink: /math/statistics-units-3-6-7-journal/
section: Mathematics
summary: Real-time learning record for Statistics Units 3, 6, and 7.
journal_type: unit
subject: Mathematics
unit: Statistics Units 3, 6, and 7
---

# Statistics Units 3, 6, and 7 Learning Journal

## Unit purpose

记录 AP Statistics Unit 3（Summary statistics）、Unit 6（Collecting data）和 Unit 7（Probability）的实际学习过程。

## Progress dashboard

| Topic | Status | Confidence | Last updated | Next step |
|---|---|---|---|---|
| Unit 3: Summary statistics | Applied | Medium | 2026-08-26 | Practice mean, median, IQR, and standard deviation questions. |
| Unit 6: Collecting data | Not started | — | 2026-08-26 | No study record yet. |
| Unit 7: Probability | Not started | — | 2026-08-26 | No study record yet. |

## Key knowledge and vocabulary

| Concept or term | My current explanation | Example or connection | Status |
|---|---|---|---|
| Mean, median, and mode | Mean is the average, median is the middle ordered value, and mode is the most frequent value. | In the coffee dot plot, median is at 3 cups and mean is about 2.33 cups. | Applied |
| IQR and standard deviation | IQR describes the middle 50%; standard deviation describes typical distance from the mean. | IQR is (Q_3-Q_1); standard deviation uses the original data units. | Exploring |
| Linear transformations | Adding a constant shifts center but not spread; multiplying scales center and spread. | Adding (c) to every value leaves IQR unchanged. | Exploring |
| Box plots and outliers | A box plot summarizes five-number information; an outlier is unusually far from the main data. | The box is from (Q_1) to (Q_3), with a median line inside. | Exploring |
| Collecting data | Not yet recorded. | Unit 6 topic. | Not started |
| Probability | Not yet recorded. | Unit 7 topic. | Not started |

## Learning entries

### Learning entry — 2026-08-26 — Unit 3 summary-statistics video map

#### Date

2026-08-26

#### Subject and topic

Statistics — Unit 3: Exploring one-variable quantitative data: Summary statistics

#### Source or activity

Khan Academy lesson page: “Unit 3: Exploring one-variable quantitative data: Summary statistics.” The current page listed 19 videos across measuring center, spread, transformations, standard deviation, and box plots.

#### What I knew or assumed before

已经知道 median、quartile、IQR、range、outlier 和 box plot 的基本含义，但还没有系统连接 mean、standard deviation、variance、linear transformations 以及 summary-statistics 的选择。

#### What I learned

- Mean 是所有观测值的总和除以观测数；median 是排序后的中间位置；mode 是出现次数最多的值。
- 在 histogram 中找 median 时，要按频数累计定位 50% 的位置，通常只能找到所在区间。
- 已知 mean 时，数据总和等于 (n\times\text{mean})，可用总和减去已知值求 missing value。
- 增加或删除 outlier 时，mean 通常比 median 改变得更明显。
- IQR 是 (Q_3-Q_1)，表示中间 50% 数据的 spread；standard deviation 表示数据偏离 mean 的典型程度。
- 对每个数据加同一个数，会让 mean、median、quartiles 一起平移，spread 不变；乘以正数会按相同倍数改变中心和 spread。
- 分布大致对称且没有明显 outlier 时，mean 和 standard deviation 更合适；偏斜或有 outlier 时，median 和 IQR 更稳健。
- Box plot 显示 minimum、(Q_1)、median、(Q_3)、maximum；方框表示中间 50%。
- optional videos 解释为什么样本 variance 使用 (n-1)，以及 simulation 如何显示 (n-1) 能减少低估 bias。

#### Evidence, example, or application

视频顺序形成一条完整链条：先用 mean/median/mode 描述 center，再用 IQR/variance/standard deviation 描述 spread，接着观察数据变换如何影响统计量，最后用 box plot 和 outlier 规则概括分布。一个具体关系是：

$$
IQR=Q_3-Q_1
$$

若原数据每个值都加 (c)，则 mean、median、(Q_1)、(Q_3) 都加 (c)，但 IQR 不变。

#### My explanation now

Summary statistics 用少量数字概括一组定量数据。先判断分布是否偏斜或有 outlier，再决定用 mean/standard deviation 还是 median/IQR；不能只报一个数字而不说明变量、单位和数据情境。

#### Question or uncertainty

- (n-1) 为什么能修正 sample variance 的低估？
- 在实际题目中，什么时候要用 exact calculation，什么时候只能从 histogram 估计？
- standard deviation 和 IQR 都是 spread 时，如何根据图形快速选择？

#### Mistake or confusion

本次主要是视频内容整理，尚未完成对应练习。容易混淆的点是把 variance 和 standard deviation 当成同一个量，以及忘记 IQR 只描述中间 50%。

#### Correction

Variance 是 squared deviations 的平均量，单位是原单位的平方；standard deviation 是 variance 的平方根，回到原单位。IQR 只使用 (Q_1) 和 (Q_3)，不受最小值和最大值直接决定。

#### Confidence

Low to Medium — 能说出各统计量的功能和主要公式，但还需要通过练习确认计算和选择。

#### Progress

Exploring

#### Next focus

Mean、median、IQR、standard deviation 和 box plot 的计算与比较题。

### Learning entry — 2026-08-26 — Estimating mean and median from a dot plot

#### Date

2026-08-26

#### Subject and topic

Statistics — Estimating mean and median in data displays

#### Source or activity

Khan Academy practice: Eloise’s coffee consumption over 15 workdays.

#### What I knew or assumed before

知道 median 要看排序后的中间位置，也知道 mean 是 average，但不清楚如何从 dot plot 判断 mean 应该靠近哪个标记点。

#### What I learned

- 15 个观测值的 median 是排序后的第 8 个值。
- mean 要把所有观测值的总和除以 15；每个 dot 都要计入，不能只看最高的一堆。
- 3 cups 的数据最多，所以 median 在 3 cups 附近；较低的 0、1、2 cups 会把 mean 从 3 向左拉。
- 这张图中 median 的近似位置是 C，mean 的近似位置是 B。

#### Evidence, example, or application

Dot plot 中 0 cups 有 1 天、1 cup 有 2 天、2 cups 有 3 天、3 cups 有 9 天，共 15 天：

$$
\text{mean}=\frac{0(1)+1(2)+2(3)+3(9)}{15}=\frac{35}{15}\approx2.33
$$

第 8 个排序值是 3，因此 median 为 3。2.33 更接近 B，而 3 对应 C。

#### My explanation now

Median 是位置概念：找中间的观测值。Mean 是平衡点：所有 dot 都影响它，低值会把它拉低，高值会把它拉高。最高的 dot stack 不一定就是 mean。

#### Question or uncertainty

当 mean 和 median 很接近时，只看图形如何判断哪个位置更准确？

#### Mistake or confusion

一开始不理解第二个问题，以为 mean 应该在最多 dots 的 3 cups 处，或者不清楚如何从图上“定位” mean。

#### Correction

不能只看频数最高的位置；先用每个横坐标的 frequency 做加权总和，再除以观测数。低值使 mean 约为 2.33，因此它在 B，而不是 C。

#### Confidence

Medium — 已能解释 dot plot 中 mean 和 median 的不同，并完成这道题的判断。

#### Progress

Applied

#### Next focus

用不同偏态和离群值的 dot plots 比较 mean 与 median。

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

## Questions I am carrying forward

- 为什么 sample variance 使用 (n-1)？
- 如何从 histogram 判断统计量只能近似而不能精确读取？
- 为什么偏低的观测值会把 mean 拉离 median？

## Review record

| Date | Topic | What I could recall | What needs more practice |
|---|---|---|---|
| 2026-08-26 | Unit 3 summary statistics | 能按视频顺序解释 center、spread、transformations、standard deviation、box plots 和 outliers。 | 计算题、(n-1) 的理由，以及从图表估计统计量。 |
| 2026-08-26 | Mean and median from a dot plot | 能用第 8 个排序值找 median，并用加权总和算 mean 约为 2.33。 | 从更多 dot plots 判断 mean、median 与偏态的关系。 |
