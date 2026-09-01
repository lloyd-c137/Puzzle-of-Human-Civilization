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
| Unit 3: Summary statistics | 2026-08-31 | Practice applying shifts and scales to profit and unit-conversion problems. |
| Unit 6: Collecting data | 2026-08-31 | Revisit bias versus sampling variability, then independently classify new study designs and scope of inference. |
| Unit 7: Probability | 2026-08-31 | Recheck conditional probability and complete an unassisted mixed-problem checkpoint; the current exercise evidence is not independent mastery evidence. |

## Key knowledge and vocabulary

| Concept or term | My current explanation | Example or connection |
| --- | --- | --- |
| Mean, median, and mode | Mean is the average, median is the middle ordered value, and mode is the most frequent value. | In the coffee dot plot, median is at 3 cups and mean is about 2.33 cups. |
| IQR and standard deviation | IQR describes the middle 50%; standard deviation describes typical distance from the mean. | IQR is (Q_3-Q_1); standard deviation uses the original data units. |
| Sample standard deviation | For a sample, square each deviation from the mean, add them, divide by (n-1), then take the square root. | With 4 visits, the denominator is (4-1)=3, and the division belongs inside the square root. |
| Linear transformations | Adding a constant shifts center but not spread; multiplying scales center and spread. | Adding (c) to every value leaves IQR unchanged. |
| Box plots and outliers | A box plot summarizes five-number information; an outlier is unusually far from the main data. | The box is from (Q_1) to (Q_3), with a median line inside. |
| Collecting data | The population is the full group of interest; the sample is the group actually observed. Random sampling supports generalization to the sampled population, while random assignment supports cause-and-effect conclusions. | Unit 6 connects sampling methods, bias, randomized blocks, matched pairs, and scope of inference. |
| Probability | Probability can be estimated from simulation frequency; for unions use the addition rule, for conditional probability restrict the denominator to the condition, and for “at least one” use the complement. | Unit 7 connects two-way tables and Venn diagrams to (P(A\mid B)=P(A\cap B)/P(B)), multiplication, and (1-P(\text{none})). |

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

### Learning record — 2026-08-31 — Understanding the sample standard deviation question

#### question

what does the current question mean

#### respond

The Khan Academy exercise gives a sample of candy counts: 1, 2, 1, and 4, with mean 2. It asks you to inspect Dwight’s written sample-standard-deviation formula and identify the error. The deviations are squared correctly, and because there are 4 observations the sample denominator is (n-1)=3. The live formula shows the whole fraction, including the 3, under the square root. The earlier explanation misread the radical; the standard sample formula is the whole fraction under the square root.

#### reflection

The difficulty was interpreting what the question requires, rather than calculating every step. The learner needs to distinguish “find the value” from “find the error in someone’s calculation.” The formula notation also needed a visual recheck after the earlier explanation was incorrect. Current understanding of the task is developing; the next check is to explain why the denominator is (n-1) for a sample and where it belongs in the formula.

### Learning record — 2026-08-31 — Meaning of the sample denominator

#### question

what is sample denominator

#### respond

The denominator is the bottom number in a fraction. In sample standard deviation, the sample denominator is (n-1): (n) is the number of observations in the sample. Dwight has 4 observations, so his denominator is (4-1)=3. The formula divides the sum of squared deviations by 3 before taking the square root.

#### reflection

The learner needed the vocabulary “denominator” connected to the formula. They now have the direct meaning and the calculation for this problem; the reason for using (n-1) still needs reinforcement. A useful next check is identifying the denominator for a different sample size.

### Learning record — 2026-08-31 — Meaning of a fraction

#### question

what is fraction

#### respond

A fraction shows division or part of a whole. It has a numerator on top and a denominator on the bottom. For example, (3/4) means 3 equal parts out of 4. In Dwight’s formula, the fraction means divide the sum of the squared deviations by 3.

#### reflection

The learner needed the basic vocabulary behind the standard-deviation formula. They can now connect numerator, denominator, and division to the current problem. Continue checking these words while reading formulas.

### Learning record — 2026-08-31 — Interpreting “only take the square root of the numerator”

#### question

**“He should only take the square root of the numerator.”**
what does this mean

#### respond

The sentence means: take the square root of only the top of the fraction, while leaving the denominator 3 outside:

$$
\frac{\sqrt{(1-2)^2+(2-2)^2+(1-2)^2+(4-2)^2}}{3}
$$

On the live page, Dwight’s displayed formula has the entire fraction under the square root:

$$
\sqrt{\frac{(1-2)^2+(2-2)^2+(1-2)^2+(4-2)^2}{3}}
$$

Therefore, the answer choice is describing a different placement of the square root. The standard sample standard-deviation formula uses the second form, so the earlier claim that this choice was correct was a misreading.

#### reflection

The learner understood the words as a phrase but needed to see exactly which part of the fraction the square-root sign covers. The key correction is that a radical covering the fraction includes the denominator; a radical covering only the numerator does not. Current understanding is improving through direct comparison of the two forms.

### Learning record — 2026-08-31 — Meaning of deviation

#### question

what is deviation

#### respond

A deviation is the difference between one data value and the mean:

$$
\text{deviation}=x-\bar{x}
$$

For Dwight’s data, the mean is 2. The deviations are: (1-2)=-1, (2-2)=0, (1-2)=-1, and (4-2)=2. A negative deviation means the value is below the mean; a positive deviation means it is above the mean.

#### reflection

The learner needed the vocabulary in the standard-deviation formula. They can connect each data value to its distance from the mean; squaring the deviations prevents negative and positive differences from canceling. Continue reinforcing deviation before calculating variance or standard deviation.

### Learning record — 2026-08-31 — Meaning of standard deviation

#### question

what is standard deviation

#### respond

Standard deviation measures how spread out data values usually are from the mean. A small standard deviation means the values are close to the mean; a large standard deviation means they are more spread out. For a sample, calculate the mean, find and square each deviation, divide the sum by (n-1), and take the square root.

For Dwight’s data, the squared deviations total 6 and the denominator is 3:

$$
s=\sqrt{\frac{6}{3}}=\sqrt{2}\approx1.41
$$

The standard deviation is about 1.41 candies, in the original unit of candies.

#### reflection

The learner is building the concept from its component vocabulary: fraction, denominator, and deviation. They can now see standard deviation as a measure of typical distance from the mean, not just as a formula. Continue distinguishing variance (before the square root) from standard deviation (after the square root).

### Learning record — 2026-08-31 — Chinese term for standard deviation

#### question

whats the chinese word for standard deviation

#### respond

The Chinese term for standard deviation is **标准差** (biāo zhǔn chā). “Sample standard deviation” is **样本标准差**.

#### reflection

The learner connected the English statistics term to its Chinese equivalent. The vocabulary entry was added to the shared vocabulary file; continue using both terms while reading the Khan Academy formulas.

### Learning record — 2026-08-31 — Is standard deviation the average deviation?

#### question

is it the average value of every deviation

#### respond

No. The ordinary average of the deviations from the mean is always 0 because values below the mean and above the mean cancel out. For Dwight’s data, the deviations are (-1, 0, -1, 2), whose average is 0. Standard deviation instead uses squared deviations, averages them using the sample denominator (n-1), and then takes the square root:

$$
s=\sqrt{\frac{1^2+0^2+(-1)^2+2^2}{3}}=\sqrt{2}\approx1.41
$$

#### reflection

The learner connected standard deviation with averaging deviations but needs to distinguish the ordinary average from the square-rooted average of squared deviations. The cancellation problem explains why raw deviations are squared. Current understanding is developing.

### Learning record — 2026-08-31 — Procedure for calculating sample standard deviation

#### question

how do we calculate the standard deviation,we use every deviation's square,then add them together and devide them by the (n-1),then 开平方 ,is it

#### respond

Yes. For a sample standard deviation, the steps are: find the mean; calculate each deviation from the mean; square every deviation; add the squared deviations; divide by (n-1); then take the square root (开平方). In symbols:

$$
s=\sqrt{\frac{\sum (x_i-\bar{x})^2}{n-1}}
$$

For Dwight’s data, the squared deviations add to 6, and (n-1)=3, so (6/3)=2 and the square root is about 1.41.

#### reflection

The learner correctly reconstructed the full sample-standard-deviation procedure and used “开平方” for square root. Their sequence is correct; continue practicing the order and remembering that the denominator is (n-1) only for a sample.

### Learning record — 2026-08-31 — Meaning of numerator

#### question

what is numerator

#### respond

The numerator is the top number or expression in a fraction. In (6/3), 6 is the numerator and 3 is the denominator. In the standard-deviation formula, the numerator is the sum of the squared deviations:

$$
(1-2)^2+(2-2)^2+(1-2)^2+(4-2)^2=6
$$

#### reflection

The learner is identifying the parts of the standard-deviation fraction one term at a time. They can now distinguish the numerator (top: 6) from the denominator (bottom: 3); continue connecting both to the full formula.

### Learning record — 2026-08-31 — Interpreting the visual standard-deviation video

#### question

interpret this video for me

#### respond

The video asks you to rank dot plots from largest standard deviation to smallest. Its main idea is that standard deviation measures the typical distance of the data points from their own mean. First estimate the mean, which is usually near the balance point or center. Then compare how far the dots usually are from that center: dots moved farther away increase standard deviation, while dots moved closer decrease it. When graphs have different means, compare each graph to its own mean rather than comparing their horizontal positions. The video’s visual rule is: more data spread around the mean usually means larger standard deviation; tighter clustering around the mean means smaller standard deviation.

#### reflection

The learner is connecting the calculation formula to a graph. The important distinction is between overall location and spread: a graph can be centered at a different value but still have a smaller or larger standard deviation. Current understanding is developing; the next check is to rank two simple dot plots by typical distance from their means.

### Learning record — 2026-08-31 — Ordering dot plots by standard deviation

#### question

explain the current question for me

#### respond

The live exercise shows three dot plots and asks for largest standard deviation at the top and smallest at the bottom. Compare each plot’s dots with its own mean. The first plot has values 0, 2, 4, 6, 8, centered at 4, with dots as far as 4 units away. The second has values 0, 1, 2, 3, 4, centered at 2, with dots as far as 2 units away. The third has values 6, 8, 8, 8, 10, centered at 8; most dots are at the mean and only two are 2 units away. Therefore the order is first plot, second plot, third plot. The “There you go!” message confirms the answer was accepted.

#### reflection

The learner is applying the visual meaning of standard deviation: compare typical distance from each plot’s own mean. The key distinction is that the third plot spans from 6 to 10 but still has the smallest standard deviation because most observations are concentrated at 8. The learner has successfully applied the idea in a live exercise.

### Learning record — 2026-08-31 — Comparing three dot plots

#### question

is this correct? why

#### respond

In the pictured exercise, all three dot plots have mean 50. The first plot’s x-locations are 0, 40, 60, 100, each repeated twice; the second’s are 0, 20, 80, 100, each repeated twice; and the third’s are 20, 40, 60, 80, each repeated twice. Comparing one of each location gives squared-deviation totals of 5200, 6800, and 2000; repeating every location twice doubles all totals without changing the order. Therefore, from largest to smallest standard deviation, the order is second plot, first plot, third plot. The second plot is largest because its dots are generally farther from 50; the third is smallest because all dots are closer to 50.

#### reflection

The learner is checking a visual comparison rather than calculating a full standard deviation. The useful shortcut here is that the means are equal, so compare distances from 50 directly. Current application is developing; continue checking the center first and spread second.

### Learning record — 2026-08-31 — New randomized dot-plot comparison

#### question

explain the current question for me

#### respond

The live Khan Academy exercise again asks for largest standard deviation at the top and smallest at the bottom. This version has seven dots on a 0–20 scale, and all three means are 10. The first plot has counts 1, 1, 3, 1, 1 at equally spaced locations from 0 to 20, so most dots are near 10. The second has two dots near each endpoint and one dot at each of the three interior locations, so its dots are farther from 10 than in the first plot. The third has three dots at 0, one at 10, and three at 20, so six of seven dots are 10 units from the mean. Therefore the order from largest to smallest standard deviation is third plot, second plot, first plot.

#### reflection

The learner is practicing the same idea with a randomized graph. The useful shortcut is that all means are equal, so compare the dots’ distances from 10; the number of dots at each location matters. The page currently says “Not quite,” so the previous attempt needs correction rather than being treated as confirmed.

### Learning record — 2026-08-31 — Reading a visual standard-deviation graph

#### question

how to read the graph,idont understand

#### respond

Read the horizontal axis first: it runs from 2 to 18, and equally spaced positions represent different data values. Each dot is one observation; stacked dots mean the same value occurred more than once. The first plot represents 10, 14, 14, 14, 18, with mean 14. The second represents 10, 12, 14, 16, 18, with mean 14. The third represents 2, 6, 10, 14, 18, with mean 10. Compare each dot’s distance from its own mean. The correct order from largest to smallest standard deviation is third plot, second plot, first plot.

#### reflection

The learner needed to separate the graph’s three features: horizontal position gives the data value, vertical stacking gives frequency, and distance from the mean shows spread. The learner is still developing confidence reading the plot; the next check is identifying the mean and repeated values in one plot before ranking it.

### Learning record — 2026-08-31 — Choosing mean and standard deviation versus median and IQR

#### question

interpret the current video for me

#### respond

The live video compares two pairs of summaries. Mean and standard deviation work well for roughly symmetric data without major outliers. Median and IQR are more resistant to extreme values, so they are usually better for skewed data or data with outliers. The salary example is 35, 50, 50, 50, 56, 60, 60, 75, and 250 (in thousands). The outlier 250 pulls the mean up to about 76.2, while the median is 56 and better represents the typical salary. For spread, the IQR is 67.5-50=17.5; the standard deviation is also affected by the extreme salary. The key pairing is: mean with standard deviation, or median with IQR.

#### reflection

The learner is extending the idea of spread from dot plots to choosing appropriate summary statistics. The main distinction is that “robust” means less affected by outliers; it does not mean mean and standard deviation are always wrong. Continue practicing the choice using distribution shape and outliers.
### Learning record — 2026-08-31 — Effects of shifting and scaling data

#### question

interpret the videos and article from this lesson for me

#### respond

The live Khan Academy lesson, “Effects of linear transformations,” contains the video “How parameters change as data is shifted and scaled” and the article “Transforming data problem.”

The main distinction is:

| Transformation | Mean and median (center) | Standard deviation and IQR (spread) |
|---|---|---|
| Add or subtract a constant: \(x+c\) | Add or subtract the same constant | Unchanged |
| Multiply or divide by a positive constant: \(kx\) | Multiply or divide by that factor | Multiply or divide by that factor |

“Shift” means adding or subtracting the same amount from every data value. “Scale” means multiplying or dividing every value by the same amount. Center tells where the data is located; spread tells how far the values vary. Adding 5 moves the mean and median 5 units but leaves standard deviation and IQR unchanged. Multiplying by 5 multiplies the mean, median, standard deviation, and IQR by 5.

The article applies the rule to actual summaries. The raw quiz scores are 6, 7, 8, 9, and 10, with mean 8, median 8, sample standard deviation 1.41, IQR 3, and range 4. Adding 1 extra-credit point produces 7, 8, 9, 10, and 11: the mean and median become 9, while the standard deviation stays 1.41, the IQR stays 3, and the range stays 4. Multiplying the new scores by 10 produces final grades 70, 80, 90, 100, and 110: the mean and median become 90, the range becomes 40, the IQR becomes 30, and the sample standard deviation becomes about 14.1.

The temperature example combines both operations: \(C=(F-32)\times\frac{5}{9}\). A mean of \(104^\circ F\) becomes \(40^\circ C\), and a standard deviation of \(9^\circ F\) becomes \(5^\circ C\). Subtracting 32 shifts the data and does not change spread; multiplying by \(\frac{5}{9}\) scales both center and spread.

#### reflection

The learner already understands mean, median, IQR, and standard deviation separately but is building the connection between a transformation and the summary statistics. The key correction is not to assume that every numerical change affects spread: a shift changes center only, while a scale changes center and spread. Current understanding is developing; the next check should apply the rule to a new transformation without recalculating every value.

### Learning record — 2026-08-31 — Interpreting a profit transformation question

#### question

A school sells pizza slices at the concession stand during each sporting event. The school sells a mean of  slices per event with a standard deviation of  slices.
The school spends  of fixed costs to buy the pizza before the event and earns a revenue of  per slice. They calculate their profit per event according to this formula:
**What will be the mean and standard deviation of the distribution of profit per event?**
 what does this mean

#### respond

The live exercise supplies these values: the mean number of slices is 200, the standard deviation is 25 slices, the fixed cost is $160, and the revenue is $2 per slice.

Let (x) be the number of slices sold in one event. The school earns (2x) dollars in revenue, then pays the fixed $160 cost, so profit is:

\[
P=2x-160
\]

The question asks about the profit across many sporting events:

- “Mean profit” means the average profit per event.
- “Standard deviation of profit” means how much profit typically varies from event to event.

This is a linear transformation. Multiplying the slice count by 2 multiplies both the mean and standard deviation by 2. Subtracting the fixed cost of 160 changes the mean but does not change the standard deviation. Therefore the two calculations to use are:

\[
\text{mean profit}=2(200)-160
\]
\[
\text{standard deviation of profit}=2(25)
\]

#### reflection

The learner needed help translating the story into a variable and a profit formula. The key understanding is that fixed cost is subtracted from every event, so it shifts the profit distribution without changing its spread; revenue per slice is the multiplier that changes both center and spread. The learner can next calculate the two displayed expressions and match them to the answer choices.

### Learning record — 2026-08-31 — Why the number of slices varies

#### question

why does 场比赛卖出的披萨片数量会变化：

#### respond

题目把“每场比赛卖出的披萨片数量”当作一个变量，因为不同比赛的观众人数、比赛类型或现场情况可能不同，所以学校每场卖出的数量可能不同。200 片是许多场比赛的平均数量，不是每一场都卖 200 片；25 片的标准差描述这些场次之间通常会相差多少片。

#### reflection

The learner needed to distinguish an average from a fixed value. The number of slices is allowed to vary from event to event; that variation is exactly why the problem gives a standard deviation. The learner now needs to connect this variable to the profit formula (P=2x-160).

### Learning record — 2026-08-31 — Why profit standard deviation is multiplied by 2

#### question

\\[ \\text{利润的标准差}=2(25)=\\$50 \\] 怎么来的

#### respond

每片披萨带来 \($2\) 收入，所以利润中的变化部分是 (2x)。原来卖出数量的标准差是 25 片，乘以 2 后，利润的标准差也乘以 2：

\[
\text{standard deviation of profit}=2\times25=\$50
\]

固定成本 \($160\) 是每场都要支付的相同金额。把每个利润都减去 \($160\) 只会整体向下平移，不会改变数据之间的距离，因此不会改变标准差。

#### reflection

The learner needed to understand why a multiplier changes standard deviation. The key idea is that standard deviation measures distances from the mean: multiplying every value by 2 doubles every distance, while subtracting the same fixed amount leaves all distances unchanged.

### Learning record — 2026-08-31 — Using a concrete example for the profit spread

#### question

我没看懂

#### respond

用三个假设的活动来理解：平均卖出 200 片，每片收入 \($2\)，固定成本都是 \($160\)。

| 卖出数量 | 利润 |
|---:|---:|
| 175 片 | \($2(175)-160=\$190\) |
| 200 片 | \($2(200)-160=\$240\) |
| 225 片 | \($2(225)-160=\$290\) |

卖出数量从 175 到 200，相差 25 片；利润从 190 到 240，相差 \($50\)。卖出数量从 200 到 225，也相差 25 片；利润从 240 到 290，也相差 \($50\)。所以数量的每一片变化都会变成利润的 \($2 变化，标准差也要乘以 2：

\[
25\text{ slices}\times\$2/\text{slice}=\$50
\]

固定成本 \($160\) 在每一行都被减去相同的数，因此只会把所有利润一起向下移动，不会改变它们之间的距离。

#### reflection

The learner did not yet see why the standard deviation is transformed by the revenue multiplier. The concrete table shows that a 25-slice difference always becomes a $50 profit difference, while the fixed cost affects every event equally. Continue using numerical examples before returning to the transformation rule.

### Learning record — 2026-08-31 — Meaning of standard deviation

#### question

标准差是什么

#### respond

标准差是衡量一组数据通常离平均值多远的数值。

- 标准差小：数据大多靠近平均值，比较集中。
- 标准差大：数据离平均值较远，比较分散。

例如，数据 9、10、11 的平均值是 10，所有数都靠近 10，所以标准差较小。数据 1、10、19 的平均值也是 10，但数值离 10 更远，所以标准差较大。

标准差不是直接把正负偏差相加，因为它们会互相抵消。计算时先把偏差平方、求平均（样本使用 (n-1)），最后开平方。在披萨题中，卖出数量的标准差是 25 片；每片对应 \($2，所以利润的典型变化是 (25\times2=\$50)。

#### reflection

The learner is building the basic meaning of standard deviation before applying the transformation rule. The learner now needs to distinguish “average value” from “typical distance from the average.” Continue with small data sets and visual comparisons before using the full formula.

### Learning record — 2026-08-31 — Why sample variance uses (n-1)

#### question

interpret the videos and article from this lesson for me

#### respond

The live Khan Academy lesson is “More on standard deviation (optional).” It contains four videos and an interactive article. They all investigate why sample variance uses (n-1) in the denominator.

1. Review and intuition: A population has size (N), while a sample has size (n). A population mean and variance are parameters; a sample mean and variance are statistics used to estimate them. When deviations are measured from the sample mean, the sample mean is calculated from the same sample and lies within it. This usually makes the squared deviations smaller than they would be if we knew the true population mean, so dividing by (n) tends to underestimate population variance. Dividing by the smaller number (n-1) makes the estimate slightly larger.

2. Why we divide by (n-1): A simulation repeatedly samples from a population and compares division by (n), (n-1), and (n-2). Across many samples, division by (n) stays too low, division by (n-1) converges to the true population variance, and division by (n-2) becomes too high.

3. Simulation showing bias: The simulation generates a population and repeatedly takes samples of different sizes. Small samples are especially likely to produce a sample mean far from the population mean, making the variance calculated with denominator (n) too small. The average biased estimate approaches \(\frac{n-1}{n}\) times the population variance.

4. Simulation providing evidence: The simulation tests denominators of the form (n+a). After many random samples, the best value is (a=-1), which means the denominator (n-1). Values smaller than (n-1) overestimate; values larger than (n-1), including (n), underestimate.

5. Article: The article is an interactive computer simulation. You create a population, take repeated samples, and compare variance estimates using different denominators. It gives visual evidence for the same conclusion: (n-1) produces an unbiased estimate on average.

The practical formula is:

\[
s^2=\frac{\sum (x_i-\bar{x})^2}{n-1}
\]

This is the **sample variance**. The sample standard deviation is its square root:

\[
s=\sqrt{\frac{\sum (x_i-\bar{x})^2}{n-1}}
\]

“Unbiased” does not mean every sample gives the exact population variance. It means that if we repeatedly take samples and average their estimates, the average tends to equal the true population variance.

#### reflection

The learner has already practiced the sample-standard-deviation formula but needed the reason for (n-1). The central distinction is between one sample estimate and the average behavior of many sample estimates: dividing by (n) is usually too small, while (n-1) corrects that downward bias on average. The next useful check is to explain why a smaller denominator produces a larger variance estimate.

### Learning record — 2026-08-31 — Calculating the interquartile range

#### question

how do we calculate the **interquartile range (IQR)**

#### respond

The interquartile range measures the spread of the middle 50% of an ordered data set:

\[
IQR=Q_3-Q_1
\]

To calculate it:

1. Put the values in order from smallest to largest.
2. Find the median. This is (Q_2).
3. Find (Q_1), the median of the lower half.
4. Find (Q_3), the median of the upper half.
5. Subtract (Q_1) from (Q_3).

For an odd number of values, leave the overall median out of both halves. For an even number of values, split the ordered list into two equal halves. For example, with 2, 4, 5, 7, 8, 10, 12, 15:

- lower half: 2, 4, 5, 7, so (Q_1=(4+5)/2=4.5);
- upper half: 8, 10, 12, 15, so (Q_3=(10+12)/2=11);
- (IQR=11-4.5=6.5).

The IQR is not the range. The range uses the maximum and minimum; the IQR focuses on the middle half and is less affected by extreme values.

#### reflection

The learner is reviewing how to calculate a resistant measure of spread. The important steps are ordering the data, separating the lower and upper halves, and averaging the two middle values when a half has an even number of values. Continue with a quiz example and check that the overall median is not included in either half when the data set has an odd number of values.

### Learning record — 2026-08-31 — IQR with eleven values

#### question

如果是11个数字呢

#### respond

11 个已经排序的数据共有奇数个值。位置是：

- 第 6 个值是总体中位数 (Q_2)；
- 下半部分是第 1 至第 5 个值，所以 (Q_1) 是第 3 个值；
- 上半部分是第 7 至第 11 个值，所以 (Q_3) 是第 9 个值。

第 6 个总体中位数不放入上下半部分。例如数据是 1 到 11：(Q_1=3)，(Q_3=9)，因此 (IQR=9-3=6)。

#### reflection

The learner is checking how the odd-number rule works with 11 values. The important position pattern is (Q_1) at the 3rd value, the overall median at the 6th value, and (Q_3) at the 9th value. Continue by applying these positions to a nonconsecutive ordered list.

### Learning record — 2026-08-31 — Reading box plots and judging outliers

#### question

interpret the videos and article from this lesson for me

#### respond

The live Khan Academy lesson is “Graphical representations of summary statistics.” It currently lists three videos and three exercises; no article is listed in the lesson contents.

1. Reading box plots: A box-and-whisker plot summarizes a quantitative data set using five values. The left whisker shows the minimum, the left edge of the box is (Q_1), the line inside the box is the median (Q_2), the right edge is (Q_3), and the right whisker shows the maximum. The range is maximum minus minimum, and the IQR is (Q_3-Q_1). The four sections represent approximately 25% of the data each.

   In the video’s tree-age example, the minimum is 8, the maximum is 50, the range is (50-8=42), and the median is 21. The median does not have to be in the center of the box or the whole graph; its position shows that the distribution is not symmetric.

2. Interpreting box plots: A box plot can support statements about minimums, maximums, medians, quartiles, and approximate percentages. It cannot tell us the exact number of observations at a particular value or whether there is only one observation at an endpoint. For example, if (Q_1=10), at least about 75% of the values are 10 or greater, but the plot alone may not tell us exactly how many values equal 10. A statement can be true, false, or impossible to decide from the information shown.

   The important habit is to ask whether every data set consistent with the box plot would make the statement true. If some possible data sets make it true and others make it false, the correct conclusion is that there is not enough information.

3. Judging outliers: The lesson uses the (1.5\times IQR) rule. First calculate (Q_1), (Q_3), and (IQR). Then calculate the fences:

\[
\text{lower fence}=Q_1-1.5(IQR)
\]
\[
\text{upper fence}=Q_3+1.5(IQR)
\]

Values below the lower fence or above the upper fence are potential outliers. In the video’s data, (Q_1=13), (Q_3=18), and (IQR=5), so the fences are (5.5) and (25.5). The values 1 are outliers; 6 is not, and there are no high-side outliers.

When drawing a modified box plot, the whiskers end at the smallest and largest non-outlier values, and outliers are shown as separate points. A basic box plot may instead extend the whiskers to the minimum and maximum.

#### reflection

The learner is connecting the earlier IQR work to box plots. The main distinctions are: the box shows the middle 50%, whiskers show the outer data or non-outlier ends depending on the convention, and a box plot gives quartile information but not every individual data value. The learner also needs to practice separating statements that are definitely true from statements that cannot be determined. The next check is to read one box plot by identifying its five-number summary before evaluating a claim.

### Learning record — 2026-08-31 — Reading a quartile percentage from a box plot

#### question

teach me the current question

#### respond

The live exercise shows the number of house boats at marinas. Read the five-number summary from left to right: minimum (12), (Q_1=18), median (Q_2=23), (Q_3=26), and maximum (29).

The question asks: “About what percent of marinas have fewer than 23 house boats?” The value 23 is the median, shown by the line inside the box. The median divides the data into two approximately equal groups. Therefore, about 50% of the marinas have fewer than 23 house boats. This corresponds to choice C.

The quartile sections also show the reasoning: the values below 23 include the first quartile (about 25%) and the second quartile (about 25%), giving approximately (25\%+25\%=50\%). “About” is used because the graph gives estimated summary values and quartiles describe proportions approximately.

#### reflection

The learner is practicing how to convert a box-plot position into a percentage. The key step is to identify whether the stated number is the minimum, (Q_1), median, (Q_3), or maximum. A value at the median has about half the observations below it and half above it. Continue with questions that refer to (Q_1) and (Q_3), where the expected percentages are about 25% and 75%.

### Learning record — 2026-08-31 — Finding low outliers with the IQR rule

#### question

explain the current question for me

#### respond

The live exercise shows the number of e-mails deleted per day. Its five-number summary is:

\[
\text{minimum}=1,\quad Q_1=2,\quad \text{median}=3,\quad Q_3=5,\quad \text{maximum}=9
\]

The question asks for the number of low outliers using the (1.5\times IQR) rule. A low outlier must be below the lower fence.

First calculate the IQR:

\[
IQR=Q_3-Q_1=5-2=3
\]

Then calculate the lower fence:

\[
Q_1-1.5(IQR)=2-1.5(3)=2-4.5=-2.5
\]

Any value below (-2.5) would be a low outlier. The minimum value is 1, which is not below (-2.5). Therefore there are 0 low outliers, which is choice A.

#### reflection

The learner is applying the IQR rule to a five-number summary rather than reading every dot individually. The important sequence is (Q_1) and (Q_3) → IQR → lower fence → compare the minimum with the fence. Continue by finding the upper fence and checking for high outliers.

### Learning record — 2026-08-31 — Identifying the IQR inside the lower-fence formula

#### question

\\(Q\_1-1.5(IQR)=2-1.5(3)=-2.5\\)这个2-1.5（3）这个3是什么

#### respond

公式是：

\[
\text{lower fence}=Q_1-1.5(IQR)
\]

这道题给出 (Q_1=2)，(Q_3=5)。先计算 IQR：

\[
IQR=Q_3-Q_1=5-2=3
\]

所以原公式中的 (3) 就是 IQR。代入后：

\[
Q_1-1.5(IQR)=2-1.5(3)=2-4.5=-2.5
\]

括号表示乘法：(1.5(3)) 就是 (1.5\times3)。

#### reflection

The learner understood the lower-fence substitution but did not recognize that the 3 came from the previously calculated IQR. The calculation must be read in order: find (IQR) first, substitute (Q_1) and (IQR), then calculate the fence.

### Learning record — 2026-08-31 — Meaning of “according to the rule for outliers”

#### question

**According to the  rule for outliers,这句话什么意思**

#### respond

这句话可以翻译为：**“根据判断异常值的规则……”**

- “according to” = 根据、按照；
- “the (1.5\times IQR) rule for outliers” = 用 (1.5\times IQR) 来判断异常值的规则；
- “low outliers” = 数值特别小、低于下边界的异常值。

完整问题的意思是：“按照 (1.5\times IQR) 异常值规则，这组数据中有多少个低异常值？”它要求先计算下边界 (Q_1-1.5(IQR))，再数有多少个数据值低于这个边界。

#### reflection

The learner needed vocabulary support for the wording of the statistics question, not a new calculation. The important distinction is that “according to” tells us which method to use, while “low outliers” tells us to check only values below the lower fence.

### Learning record — 2026-08-31 — The 1.5 times IQR outlier rule

#### question

\\(1.5\\times IQR\\) 异常值规则是什么

#### respond

The (1.5\times IQR) rule is a standard method for identifying unusually distant values.

First calculate:

\[
IQR=Q_3-Q_1
\]

Then calculate the two fences:

\[
\text{lower fence}=Q_1-1.5(IQR)
\]
\[
\text{upper fence}=Q_3+1.5(IQR)
\]

- A value below the lower fence is a low outlier.
- A value above the upper fence is a high outlier.
- A value between the fences is not an outlier according to this rule.

For the current exercise, (Q_1=2), (Q_3=5), so (IQR=3). The lower fence is (-2.5), and the upper fence is (9.5). The data range from 1 to 9, so no values cross either fence.

The rule describes a convention used by statisticians; it is not a universal law. It is useful because IQR is less affected by extreme values than the range.

#### reflection

The learner is clarifying the complete outlier procedure. The calculation order is now explicit: find (Q_1) and (Q_3), calculate IQR, calculate both fences, and compare the data values with the fences. Continue by checking high outliers separately from low outliers.

### Learning record — 2026-08-31 — Checking the upper outlier fence

#### question

当前的题目的上边界是：1920 对吗

#### respond

The live exercise has (Q_1=275) and (Q_3=933). First calculate:

\[
IQR=Q_3-Q_1=933-275=658
\]

For high outliers, use the upper fence:

\[
Q_3+1.5(IQR)=933+1.5(658)=933+987=1920
\]

Therefore, 1920 is the correct upper boundary, also called the upper fence. Any value greater than 1920 is a high outlier; a value exactly equal to 1920 is not below or above the boundary and is not counted as a high outlier.

#### reflection

The learner correctly calculated the upper fence and checked it against the live randomized question. The remaining step is to count the data values above 1920, using the histogram rather than assuming the maximum is the only possible outlier.

### Learning record — 2026-08-31 — Connecting the upper fence to a histogram

#### question

但是这个上边界怎么和当前的题目histogram结合

#### respond

The live histogram uses “number of zip codes (hundreds)” on the horizontal axis, while the five-number summary gives actual numbers of zip codes. Therefore convert the upper fence before reading the graph:

\[
1920\text{ zip codes}=19.2\text{ hundreds of zip codes}
\]

On the histogram, 19.2 is just before the tick mark at 20. To find high outliers, count the states represented by bars to the right of 19.2. The bar from 20 to 22 represents 2 states, and the bar from 24 to 26 represents 1 state. Thus the number of high outliers is (2+1=3).

The boundary is a cutoff on the horizontal axis; the height of each bar is the number of states to count. The five-number summary gives the cutoff, and the histogram gives the frequency beyond it.

#### reflection

The learner needed to connect a numerical outlier boundary to a graph with a different scale and units. The key correction is to convert 1920 zip codes into 19.2 hundreds before reading the x-axis, then add the frequencies of all bars completely above that cutoff. The learner now needs to distinguish the horizontal-axis value from the vertical-axis frequency.

### Learning record — 2026-08-31 — Finding a missing value from the mean

#### question

explain the current question for me

#### respond

The live Unit 3 test shows four apple trees with apple counts (34), (29), (36), and an unknown value for the Granny Smith tree. The mean of all four values is (35). The question asks for the missing count.

Use the relationship:

\[
\text{total}=\text{mean}\times\text{number of values}
\]

There are 4 trees, so the total number of apples must be:

\[
35\times4=140
\]

The known trees contain:

\[
34+29+36=99
\]

Therefore the Granny Smith tree has:

\[
140-99=41
\]

The answer is 41 apples. The key is to find the required total first, then subtract the known values.

#### reflection

The learner is applying mean as a total divided by the number of observations. The useful rearrangement is total (=\) mean (\times) count; after finding the total, subtract the known values to recover the missing value. Continue checking the result by verifying that ((34+29+36+41)/4=35).

### Learning record — 2026-08-31 — Finding a missing deviation in a standard-deviation formula

#### question

explain the current question for me

#### respond

The live Unit 3 test gives Roberto’s sample data: (0,2,1,2,5), with sample mean (̅x=2). There are (n=5) values, so the sample standard-deviation denominator is (n-1=4).

Roberto’s numerator includes:

\[
(2-2)^2+(1-2)^2+(2-2)^2+(5-2)^2
\]

but he forgot the first data value (0). He should also include:

\[
(0-2)^2
\]

The complete calculation is:

\[
s=\sqrt{\frac{(0-2)^2+(2-2)^2+(1-2)^2+(2-2)^2+(5-2)^2}{4}}
\]

Therefore the error is that he is missing a deviation in the numerator, choice B. The selected choice E is incorrect because the formula does contain an error.

#### reflection

The learner needs to check every original data value against the mean before accepting a standard-deviation formula. The denominator 4 is correct for a sample of 5 values; the missing part is the (0) value in the numerator. The next check is to match each data value to one squared-deviation term.

### Learning record — 2026-08-31 — Planning studies: populations, samples, and conclusions

#### question

interpret the videos and article from this lesson for me

#### respond

The live Khan Academy page is Unit 6, Lesson 1: “Introduction to planning a study.” It lists five videos and three exercises; no article is currently listed.

1. Identifying a sample and population: The population is the entire group we want to understand. The sample is the smaller group actually studied. In the video, the population is all seniors at Riverview High School, and the sample is the 100 seniors who were randomly surveyed. In the current exercise, the population is all vehicles passing through the lane with the camera, and the sample is every tenth vehicle from that lane.

2. Generalizability of survey results: Results from a random sample can usually be generalized to the population from which that sample was selected. They cannot automatically be generalized to a larger or different population. In the residence-hall example, a random sample of first-year students living in 12 residence halls supports conclusions about first-year students living in those 12 halls, not all students at the university or all first-year students.

3. Types of studies: In an experiment, researchers assign subjects to treatment and control groups, preferably randomly, and impose a treatment. This design can support a cause-and-effect conclusion. In an observational study, researchers observe existing conditions without assigning a treatment; it can show an association but not prove causation. Observational studies may be retrospective (looking at past data), prospective (following selected subjects into the future), or a sample survey (asking a sample about the present).

4. Worked observational-study example: Researchers compared farms where cows were called by name with farms where they were not. The variables were whether cows were named (categorical) and milk yield in liters (quantitative). Because the researchers only surveyed and observed existing farms, this was an observational study. The results showed an association for farmers in Great Britain, but they could not prove that naming cows caused higher milk yield. A confounding variable, such as a generally kind farmer who both names cows and treats them better, could affect both variables.

5. Invalid conclusions from studies: A random sample of 5,000 teenagers found that heavier smartphone use was associated with lower happiness. The conclusion that smartphone use makes teens less happy is invalid because the study was observational. The direction could be reversed, or another variable could influence both smartphone use and happiness. Random sampling helps generalizability; it does not by itself create causation.

The main decision rule is: random sampling supports generalizing to the sampled population; random assignment to treatments supports cause-and-effect conclusions. These are different ideas and should not be confused.

#### reflection

The learner is beginning Unit 6 and needs to separate four ideas that often appear together: population, sample, sampling generalizability, and study design. The learner should remember that observing a relationship is not the same as proving a cause. The next useful check is to classify a new study by asking who was sampled, whether a treatment was assigned, and what population the result can represent.

### Learning record — 2026-08-31 — Unit 6–7 practice consolidation and error analysis

#### question


#### respond

本次在 Khan Academy 的 AP Statistics 课程中完成了 Unit 6 和 Unit 7 的全部 16 个 practice exercise：Unit 6 共 11 个，Unit 7 共 5 个。页面上的题目均已提交并通过；这证明练习流程完成，但不等同于在无提示、无重复尝试下已经达到独立 mastery。

Unit 6 — Collecting data

- **Population and sample**：先问“想研究的完整群体是谁”，再问“实际被观察或调查的是谁”。样本是 population 的一部分，不能把 sample 自动当成 population。
- **Generalizability**：random sample 主要支持把结果推广到抽样框架对应的 population；random assignment 不负责推广，而是帮助建立因果解释。
- **Types of studies**：observational study 观察已有差异，只能支持 association；experiment 由研究者施加 treatment，并在随机分配时支持 cause-and-effect 结论。
- **Bias and sampling methods**：voluntary response、undercoverage、nonresponse 和 response bias 会使结果系统性偏离；simple random、stratified、cluster 和 systematic sampling 的区别在于如何形成样本，而不是“看起来是否随机”。
- **Experiment designs**：按已有重要特征分组后在组内随机分配是 randomized block；把相似对象两两配对后分别接受 treatment 是 matched pairs；双盲表示 subjects 和 researchers 都不知道谁接受哪种处理。
- **Scope of inference**：随机抽样回答“能否推广”，随机分配回答“能否谈因果”；两者不能互相替代。

Unit 7 — Probability

- simulation probability 是“满足条件的模拟次数 ÷ 模拟总次数”。例如 dot plot 中 20 次模拟有 13 次超过 10 次成功，估计概率为 (13/20=0.65)。
- 对互斥事件，(P(A\text{ or }B)=P(A)+P(B))；一般情形要减去重叠部分：(P(A\text{ or }B)=P(A)+P(B)-P(A\cap B))。
- 条件概率只在给定条件的子群体中计算：

  \[
  P(A\mid B)=\frac{P(A\cap B)}{P(B)}
  \]

- 一般乘法规则为 (P(A\cap B)=P(A)P(B\mid A))。without replacement 时第二次概率的分母和分子会改变；independent events 则条件概率不变。
- “at least one” 通常用补集最快：(P(\text{at least one})=1-P(\text{none}))。例如 7 个订单每个有 0.85 的 dessert 概率，则至少一个没有 dessert 的概率为 (1-0.85^7\approx0.68)。

错题与纠正分析

本次部分题目经过重复尝试，不能直接解释为学习者的真实误解；页面在错答后要求重新作答，因此记录中同时出现初次错答和后续纠正。真正有学习价值的错误模式主要有两类：多选题漏选，以及没有先确定条件事件就套用概率公式。

1. **Bias in samples and surveys：把“提醒后才回复”误判为必然的 bias。** 页面最终接受的选项是：提醒后回复本身不一定造成 bias；真正的潜在问题包括 voluntary response、email undercoverage、nonresponse，以及随机样本在不同群体间可能出现的比例失衡。纠正原则是区分“最终是否获得反馈”和“某类人是否系统性缺席或更容易回应”。
2. **Sampling method considerations：多选题第一次只选了一个正确选项。** 题目关于 cluster sample 的优点同时包含“抽到某一类别比例失衡的风险较小”和“联系少数整群更有效率”；第二个理由也必须选择。纠正原则是多选题提交前逐项检查“哪些陈述成立”，不能在找到一个正确理由后停止。
3. **Conditional probability：先后出现了 (0.55) 和 (0.44) 的错答，最终分别纠正为 (5/18) 和 (0.55)。** 关键不是直接读取某个边际概率，而是先确定分母是条件事件：例如 (P(\text{for men}\mid\text{botanic})=P(\text{for men and botanic})/P(\text{botanic})=0.05/0.18=5/18)；在 senator 表中，(P(\text{Democrat}\mid\text{returning})=33/60=0.55)。
4. **Simple random samples 与 study-design 练习中的选项错答。** 这些记录不足以单独诊断概念掌握问题；纠正时重新应用了“按随机数字表跳过重复或超出范围的号码”“按研究者是否施加 treatment、是否随机分配来分类”的规则。

#### reflection

Unit 6 的练习显示，核心分类框架已经建立：population/sample、generalizability/causality、observational/experiment、bias/sampling method 和 block/matched-pairs 能够在多种情境中应用。Unit 7 的四类练习也已通过，但重复尝试本身尚未形成独立检索证据。当前最需要复习的是条件概率的分母、互斥与重叠事件的加法规则，以及“至少一个”补集法。

下一步不应继续用完成页面数量替代 mastery 判断。应做一个无提示 mixed checkpoint：至少包含 1 道 population/sample，1 道 bias，1 道 study conclusion，1 道 conditional probability，1 道 union，1 道 “at least one” 题；要求先写出所用公式或推理，再提交答案，并记录是否需要提示。

### Learning record — 2026-09-01 — Identifying the population and sample

#### question

whats the current question

#### respond

The current Khan Academy exercise asks: “The state Department of Transportation wants to know about out-of-state vehicles that pass over a toll bridge with several lanes. A camera installed over one lane of the bridge photographs the license plate of every tenth vehicle that passes through that lane. Identify the population and sample in this setting.”

The population is all vehicles that pass through the lane with the camera. The sample is every tenth vehicle that passes through that lane, because those are the vehicles actually photographed. The question is testing the difference between the complete group of interest and the smaller group observed.

#### reflection

The learner needed the page translated into a simpler task. The important distinction is the camera’s scope: the population is not automatically every vehicle on the entire toll bridge, because the camera observes only one lane. The next check is to identify the population and sample in a new setting without relying on the answer choices.

## Concepts to revisit

- Unit 3 中 mean/median、IQR/standard deviation 的选择；
- (n-1) 对 sample variance 的作用；
- Unit 6 中 population、sample、sampling frame 与 generalizability 的边界；
- Unit 6 中 random sampling 与 random assignment 的区别；
- Unit 6 中 voluntary response、undercoverage、nonresponse、response bias 与 sampling variability 的区别；
- Unit 7 中条件概率的条件分母、互斥与重叠事件的加法规则；
- Unit 7 中 without replacement 的一般乘法规则与 “at least one” 的补集法；
- histogram 中只能估计而不能读出精确统计量的情况；
- 从 dot plot 用 frequency 加权估计 mean。

## Mistakes and corrections

| Date | Topic | Mistake | Correction |
|---|---|---|---|
| 2026-08-26 | Unit 3 summary statistics | 容易把 variance 和 standard deviation 当成同一个量。 | Variance 的单位平方，standard deviation 是 variance 的平方根，单位回到原单位。 |
| 2026-08-26 | Mean from a dot plot | 以为 mean 就在最高的 dot stack 处。 | mean 使用所有观测值；先计算加权总和再除以总数。 |
| 2026-08-31 | Reading a standard-deviation question | 不清楚题目是在要求计算数值，还是检查公式中的错误。 | 先识别题目动词；这里要比较 Dwight 的公式与 sample standard deviation 公式，并视觉检查平方根是否覆盖分母。 |
| 2026-08-31 | Unit 6 bias | 把 reminder 后才回复当成必然的 bias，忽略了“最终得到回复”和“系统性缺少某类人”的区别。 | 先判断是否存在 undercoverage、nonresponse、voluntary response 或 response bias；随机抽样比例失衡属于可能的抽样结果，需结合群体差异判断是否造成偏差。 |
| 2026-08-31 | Unit 6 multi-select sampling design | 找到一个正确理由后漏选 cluster sample 的效率理由。 | 多选题逐项验证；本题两个正确理由是减少类别比例失衡风险和联系少数整群更有效率。 |
| 2026-08-31 | Unit 7 conditional probability | 直接使用边际概率，没有先把条件事件作为分母；本次记录中的两次错答属于流程性错答。 | 使用 (P(A\mid B)=P(A\cap B)/P(B))，先圈出条件事件 (B)，再确定分母。 |
| 2026-08-31 | Unit 7 “at least one” probability | 容易逐个枚举成功情形，增加漏项风险。 | 使用补集：(P(\text{at least one})=1-P(\text{none}))，并在 independent 时用乘法计算 none。 |
