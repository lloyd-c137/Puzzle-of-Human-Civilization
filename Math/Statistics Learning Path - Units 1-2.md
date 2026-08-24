---
layout: default
title: Statistics Learning Path — Units 1–2
permalink: /math/statistics-learning-path-units-1-2/
section: Mathematics
summary: Evidence-based learning record for categorical data and one-variable quantitative data.
---

# Statistics Learning Path — Units 1–2
1. **Unit 1: Exploring categorical data**
2. **Unit 2: Exploring one-variable quantitative data: Displaying and describing**

学习周期：3天。

## Current status — 2026-08-24

Studied Unit 1 foundations and Unit 2 displays and descriptions through Khan Academy practice. Current progress: **partly understood to applied**.

- Unit 1: individuals, variables, categorical/quantitative data, bar graphs, two-way tables, and frequency comparisons.
- Unit 2: dot plots, stem-and-leaf plots, histograms, box plots, distribution shapes, clusters, gaps, peaks, outliers, center, spread, and comparisons.
- Main difficulty: reading grouped or stacked graphs without miscounting, and separating center from spread.
## Foundation — Individuals, variables, and data types

### Individuals

**Individuals** are the objects, people, places, or cases being described by a dataset. Another name is **observational units**.

Examples:

- In a survey of students, each student is an individual.
- In a dataset about websites, each website can be an individual.
- In a dataset about posts, each post can be an individual.

Always ask: **What does one row represent?** That usually identifies the individuals.

### Variables

A **variable** is a characteristic recorded for each individual. A variable can have different values for different individuals.

For the website example:

| Individual | Variable | Value |
|---|---|---|
| Website A | number of writers | 5 |
| Website A | average likes per post | 3,500 |
| Website A | revenue | $30,000 |
| Website B | number of writers | 11 |

The website name identifies the individual. Writers, likes, and revenue are variables.

### Identifier versus variable

In the school-counselor example, each **student** is an individual:

| Student name | Homeroom teacher | Absences |
|---|---|---:|
| Arianna | Mr. Shea | 4 |

“Arianna” identifies the individual in that row. The variables being recorded are **homeroom teacher** and **number of absences**.

A name can technically be stored as a categorical variable in a database, but in this statistics question it is treated as an **identifier**, not as the characteristic being analyzed. The question is asking “Who are the individuals?”, so the answer is **the students**, not “student names.”

### Categorical variables

A **categorical variable** places individuals into groups or labels. Its values answer questions such as “which kind?” or “which group?”

Examples:

- website: A or B;
- favorite subject: math, chemistry, or physics;
- transportation: walk, bus, bicycle, or car;
- completed assignment: yes or no.

The categories may be written with words or numbers. A number is still categorical if it is only a label, such as a ZIP code, student ID, or jersey number.

### Quantitative variables

A **quantitative variable** records a numerical amount for which arithmetic has a meaningful interpretation. Its values answer questions such as “how many?” or “how much?”

Examples:

- number of writers;
- number of posts;
- average likes per post;
- revenue in dollars;
- temperature in degrees Celsius;
- travel time in hours.

Counts are quantitative and usually **discrete**. Measurements such as time, distance, and temperature are quantitative and can usually vary continuously.

### A reliable classification test

Use these questions in order:

1. What is one individual or observational unit?
2. What characteristic is recorded about it?
3. Is the value a label/group, or is it a meaningful numerical amount?
4. If it is a number, would adding or averaging the values make sense?

If it is a label or group, it is categorical. If it is a meaningful numerical amount, it is quantitative.

### Common traps

- A variable written with numbers is not automatically quantitative.
- “Student ID” is categorical because the digits are labels.
- “Number of siblings” is quantitative because adding and comparing counts is meaningful.
- “Favorite number” is categorical if the number is simply a chosen label or preference.
- The same characteristic can be a different variable depending on how it is recorded. Exact age is quantitative; age group such as “teenager” or “adult” is categorical.

**Key idea:** Individuals are the “who or what.” Variables are the “what we record about them.” Data types tell us which displays and calculations are appropriate.

## Day 1 — Unit 1: categorical data

- 在 school-counselor table 中，把 Arianna、Priyanka 等识别为 individuals，把 homeroom teacher 识别为 categorical variable，把 absences 识别为 quantitative variable。
- 在 transportation example 中读出 Bus (8)、Car (5)、Walk (3)、Bicycle (4)，并判断 Bus 最常见、Walk 最少。
- 已能用 (8/20=40\%) 说明一个类别的 relative frequency，而不是只报告 count。
- 已纠正“student name 是 individual”的混淆：student 是 individual，name 是 identifier。

### Core concepts

**Categorical variable** 的取值是类别或标签，例如颜色、年级、是否参加活动。类别通常没有自然的数值顺序；即使类别用数字编码，它仍然可能是类别变量。

频数和相对频数：

$$
\text{relative frequency} = \frac{\text{category count}}{\text{total count}}
$$

$$
\text{percent} = \text{relative frequency} \times 100\%
$$

### Lesson 2 — Representing a categorical variable with graphs

The most useful graph for showing the counts of categories is a **bar graph**.

#### How to create a bar graph

1. Put the categories on the horizontal axis.
2. Put the frequency or relative frequency on the vertical axis.
3. Choose an even, clearly labeled scale.
4. Draw one bar for each category.
5. Leave spaces between bars because the categories are separate groups, not connected numerical intervals.
6. Add a title that names the variable and the population or sample.

Example data about students’ preferred transportation:

| Transportation | Number of students |
|---|---:|
| Bus | 8 |
| Car | 5 |
| Walk | 3 |
| Bicycle | 4 |

Text version of the bar graph:

```text
Preferred transportation (number of students)

Bus      ████████  8
Car      █████     5
Walk     ███       3
Bicycle  ████      4
```

This graph shows that **bus** is the most common category and **walking** is the least common category. It does not show that bus causes students to prefer it; it only describes the observed data.

#### Frequency versus relative frequency

- A graph of **frequency** uses counts, such as 8 students.
- A graph of **relative frequency** uses proportions or percentages, such as \(8/20=40\%\).

Use relative frequency when comparing groups with different total sizes. For example, 8 bus riders out of 20 students and 20 bus riders out of 100 students are not the same percentage.

#### How to read a bar graph

Look for:

- the category with the greatest or smallest bar;
- the frequency or percentage represented by a bar;
- the difference between two categories;
- the total sample size, if the graph provides it;
- a misleading scale, missing labels, or a missing title.

When comparing two groups, use the same categories and the same vertical scale. Compare percentages when the groups have different sample sizes.

#### Common mistakes

- Using a numerical line graph instead of a bar graph for categories;
- forgetting spaces between categorical bars;
- using unequal widths or an unclear vertical scale;
- comparing counts when the groups have different sample sizes;
- describing a graph without saying what the individuals or categories represent.

### Two-way tables, displays, and association

- 在网站 engagement 题中，先确认“per writer”的分母，再比较 likes/writer 和 comments/writer。
- 在 two-way table 练习中找到总计 (160)，并理解总计只能回答 count/total，不能代替 conditional comparison。
- 已知道“在 A 中有多少比例是 B”和“在 B 中有多少比例是 A”使用不同分母，不能混用。
- 已能说出 association 不等于 causation，但还没有稳定地独立计算 joint、marginal 和 conditional relative frequencies。

### Two-way tables

双向表同时记录两个类别变量。阅读每个百分比前，必须先确认分母来自哪一行、哪一列或整个表。

常见的三种比例：

- **Joint relative frequency**：某一格的数量 ÷ 总人数；
- **Marginal relative frequency**：行总计或列总计 ÷ 总人数；
- **Conditional relative frequency**：某一格的数量 ÷ 指定条件下的行总计或列总计。

### Common traps

- 样本量不同时，不能只比较 count；
- “在 A 中有多少比例是 B”和“在 B 中有多少比例是 A”不是同一个问题；
- 图表中的关联不等于因果关系；
- 百分比的分母改变时，结论也可能改变；
- 总体比例可能掩盖分组后的不同趋势。

## Day 2 — Unit 2: displaying one-variable quantitative data

- 已将 number of absences、temperature、time 和 revenue 识别为 quantitative variables，并能说明单位或计数意义。
- 能根据数据规模和目的选择 display：小数据用 dotplot/stemplot，较大数据看 histogram，需要五数概括时看 boxplot。
- 已在 building heights、die rolls、cast ages 和 nickel years 练习中描述 shape、center、spread 和 outliers。
- 已区分 tail direction 与数据堆积方向：右尾是 right-skewed，左尾是 left-skewed。

### Core concepts

**Quantitative variable** 的取值是可以进行有意义的数值运算的测量或计数，例如身高、等待时间、温度和考试分数。

描述单变量定量数据时，使用 **SOCS**：

- **Shape** — 对称、左偏、右偏、单峰、多峰；
- **Outliers** — 是否有明显离群值；
- **Center** — 典型值在哪里；
- **Spread** — 数据分散到什么范围。

### Display selection

| Display | Best use | What to inspect |
|---|---|---|
| Dotplot | 小型数据集，保留每个观测值 | clusters、gaps、重复值、离群值 |
| Stemplot | 中小型数据集，保留数值顺序 | 形状、中心、尾部、具体观测值 |
| Histogram | 较大数据集，观察整体形状 | bins、峰、偏态、间隔、范围 |
| Boxplot | 快速概括中心和离散程度 | median、quartiles、IQR、离群值 |

四分位距：

$$
IQR = Q_3 - Q_1
$$

## Day 3 — Unit 2: describing distributions and comparisons

- 已能把 median 解释为排序后的中间位置；24 个 egg cartons 的中间位置是第 12 和第 13 个。
- 重新数出 11 eggs 位置的 stacked dots 后，将错误的 median (12) 纠正为 ((11+12)/2=11.5)。
- 已能解释 range 是最大值减最小值，spread 表示数据分散程度；IQR 仍需要更多手算练习。
- 在 city-temperature、Olympic-time 和 nickel-year comparisons 中，已开始把 center、spread、shape 和 overlap 分开描述。
- 目前还没有稳定完成 mean、standard deviation、IQR 和 outlier rule 的独立计算，相关证据仍然有限。

### Center and spread

**Mean** 是所有观测值的总和除以观测数，容易受到极端值影响。

**Median** 是排序后位于中间的值，对极端值更不敏感。

**Standard deviation** 反映观测值围绕 mean 的典型离散程度；本阶段先重点理解它的解释，不急于死记计算公式。

选择描述方式的经验：

- 分布大致对称且没有明显离群值：使用 mean 和 standard deviation；
- 分布偏斜或有离群值：使用 median 和 IQR；
- 报告任何统计量时，都要说明它对应的变量、群体和单位。

### Outlier rule for practice

用 IQR 规则进行初步识别：

$$
\text{lower fence} = Q_1 - 1.5(IQR)
$$

$$
\text{upper fence} = Q_3 + 1.5(IQR)
$$

落在 fences 外的观测值可以标记为 potential outlier。它是需要进一步检查的信号，不自动等于错误数据。

## Vocabulary tracker

| Term | 中文解释 | My own example | Confident? |
|---|---|---|---|
| categorical variable | 类别变量 | Transportation type: bus, car, walk, bicycle. | Medium |
| quantitative variable | 定量变量 | Number of absences or height in meters. | High |
| relative frequency | 相对频数/比例 | (8/20=40\%) of students take the bus. | Medium |
| conditional distribution | 条件分布 | Compare the percentage of completed assignments within each class. | Low |
| association | 关联 | Two categorical variables show different conditional percentages. | Low |
| distribution | 数据分布 | The ages of the cast members from a dot plot. | Medium |
| skewed | 偏态 | A long tail to the left means left-skewed. | Medium |
| median | 中位数 | For 24 ordered values, average positions 12 and 13. | Medium |
| quartile | 四分位数 | (Q_1), median, and (Q_3) divide ordered data into four parts. | Medium |
| IQR | 四分位距 | (IQR=Q_3-Q_1), the spread of the middle 50%. | Low |
| standard deviation | 标准差 | A measure of typical distance from the mean. | Low |
| outlier | 离群值 | One egg carton with 6 intact eggs far from the 11–12 cluster. | Medium |
| cluster | 聚集 | Many apple shelf-life values close together. | Medium |
| gap | 间隔 | No sandwich-shop days from 0–39 guests. | Medium |
| peak | 峰 | The tallest nearby bar or dot stack. | Medium |
| uniform | 大致均匀 | Die-roll frequencies are approximately equal. | Medium |
| box plot | 箱线图 | Box, median line, and whiskers summarize a distribution. | Medium |

## Study log

| Date | Unit/session | Main idea | Evidence of learning |
|---|---|---|---|
| 2026-08-21 | Foundations: individuals and variables | Identify the observational unit, then classify each variable as categorical or quantitative based on whether it is a label or a meaningful numerical amount. | Began the topic using the website example and distinguished website, writers, posts, likes, and revenue. |
| 2026-08-21 | Lesson 2: bar graphs for categorical data | Turn category counts into bars, read frequencies, and use percentages when comparing groups of different sizes. | Studied a transportation-preference bar graph and identified its highest and lowest categories. |
| 2026-08-23 | Two-way tables and categorical comparisons | Read a two-way table and found a column total of 160; learned that conditional percentages are needed for fair group comparisons. | Solved the university sample question and identified the correct total. |
| 2026-08-24 | Bar graphs and frequency tables | Read equal bars and identified the two water bodies with the same number of alligators. | Compared bar lengths and connected them to equal frequencies. |
| 2026-08-24 | Stem-and-leaf plots | Reconstructed values from stems and leaves and answered exact-value and inequality questions. | Identified (37) once in a boots plot and explained the key (4|0=40). |
| 2026-08-24 | Histograms | Used bins, frequencies, boundaries, and touching bars to create and interpret histograms. | Counted cow moo frequencies and interpreted pie-count intervals. |
| 2026-08-24 | Distribution features | Identified symmetric, skewed, bimodal, uniform, clusters, gaps, peaks, and outliers. | Explained examples involving houseflies, temperatures, test scores, apples, and sandwich-shop guests. |
| 2026-08-24 | Box plots and quartiles | Read the box, median line, whiskers, quartiles, and scale; recognized symmetry and skew. | Explained chemistry-section, football-mass, and city-temperature box plots. |
| 2026-08-24 | Complete distribution descriptions | Used shape, center, spread, and outliers as a four-part checklist. | Described building heights, die rolls, cast ages, and nickel minting years. |
| 2026-08-24 | Dot-plot median | Counted repeated dots and found the middle positions (12) and (13) for 24 egg cartons. | Corrected the median to (11.5) after recounting the stack at 11 eggs. |
| 2026-08-24 | Comparing distributions | Compared center and spread in dot plots, histograms, and box plots. | Correctly interpreted Olympic times and city-temperature comparisons. |
| 2026-08-24 | Unit test: minting-year histogram | Used cumulative counts to locate the median interval and estimated the range from nonempty bins. | Median between 1990–2000, range about 110 years, left-skewed, some potential outliers. |

## Error log

| Date | Mistake | Why it happened | Correction | Recheck date |
|---|---|---|---|---|
| 2026-08-21 | Treated a student name as the individual. | Confused the row identifier with the entity described. | The student is the individual; the name identifies the row. | 2026-08-24 |
| 2026-08-23 | Confused a value with its frequency on a dot plot. | Read the count 14 as the most frequent value. | The mode is 3; 14 is the frequency. | 2026-08-24 |
| 2026-08-24 | Named skew from the side containing most data. | Focused on the pile instead of the tail. | The tail direction names skew. | 2026-08-24 |
| 2026-08-24 | Misread stacked dots at 11 eggs. | Did not count every dot at the same horizontal value. | One dot equals one carton; the corrected median is (11.5). | 2026-08-24 |
| 2026-08-24 | Confused “hotter on average” with “hotter every day.” | Ignored overlap between distributions. | Compare centers for average claims; overlap blocks every-observation claims. | 2026-08-24 |

## Detailed learning process

本部分记录实际学习过程，不只记录已经掌握的内容，也记录提问、误解、纠正、证据和信心。

### 2026-08-21 — Individuals, variables, and data types

**Source or activity:** Khan Academy, Unit 1, “Individuals, variables, and categorical & quantitative data”; school-counselor table and website table.

**Starting understanding:** 能看懂表格中的姓名、老师和数字，但还没有清楚区分 individual、identifier 和 variable。

**What was learned:**

- individual 是被研究的对象、人物、地点或案例；
- variable 是对每个 individual 记录的特征；
- categorical variable 的值是类别或标签；
- quantitative variable 的值是有实际数值意义的数量；
- 数字不一定是 quantitative data，ID、邮政编码、球衣号码可以只是标签。

**Question or confusion:** “Why is student name not a variable?” “Is a student a person?”

**Correction:** 在表格中，student 是 individual；student name 主要用来识别这一行。Homeroom teacher 是 categorical variable，absences 是 quantitative variable。姓名在数据库中可以被存成文字字段，但在这道统计题里它不是正在分析的 characteristic。

**Evidence:** Arianna、Priyanka、Vivek 等是学生 individuals；Mr. Shea 等是 teacher categories；4、5、6 是 absences 的 quantitative values。

**Confidence and progress:** categorical/quantitative classification：medium；individual 与 identifier：partly understood。

### 2026-08-21 — Bar graphs for categorical data

**Source or activity:** Khan Academy, “Representing a categorical variable with graphs”; transportation-preference example.

**What was learned:** bar graph 用一根柱表示一个 category 的 frequency 或 relative frequency。类别之间要留空隙，因为类别不是连续的数值区间；纵轴必须有清楚的刻度、标签和单位。

**Question or confusion:** 一开始不理解题目到底要求比较什么，以及为什么要从表格转成图。

**Correction:** 图表的作用是让类别的数量或百分比更容易比较。先看横轴类别，再看纵轴数值；最高的柱表示最常见类别，最低的柱表示最少类别。不同样本量的群体要比较百分比，不能只比较人数。

**Evidence:** 在 transportation example 中，Bus 为 8、Car 为 5、Walk 为 3、Bicycle 为 4，因此 Bus 最常见，Walk 最少。

**Confidence and progress:** 读单个 bar graph：medium；从 frequency table 独立制作图：needs practice。

### 2026-08-23 — Two-way tables and fair comparisons

**Source or activity:** Khan Academy, two-way frequency tables and a website-engagement comparison.

**What was learned:** two-way table 同时记录两个 categorical variables；读表时必须先确认分母。要区分 joint、marginal 和 conditional relative frequency；不同总人数的群体应比较 conditional percentages。

**Question or confusion:** “Is 160 the correct answer for the current question?”

**Correction:** 160 是相应总计，来自该列各部分的相加；但一个总数只能回答 count/total 的问题。要比较群体，必须进一步用各群体自己的总数作分母。不同分母会产生不同的问题，不能混用。

**Important language learned:** association 表示两个变量的分布有关系；association 本身不能证明 cause and effect。

**Evidence:** 网站题中分别比较 likes per writer 和 comments per writer；同一问题可以有不同的 operational definitions，因此要先明确“engagement per writer”具体指什么。

**Confidence and progress:** 读总计：medium；conditional distribution、association 与 causation：low to medium。

### 2026-08-24 — Reading bar graphs and frequencies

**Source or activity:** Khan Academy, “Read bar graphs”; alligator-count graph.

**What was learned:** bar graph 中横轴是 place/category，纵轴是 number of alligators；柱顶落在哪个刻度就表示对应频数。

**Question or confusion:** “Which bodies of water had the same number of alligators?”

**Correction:** 比较柱子的高度，而不是地点名称或柱子的顺序。Danger River 和 Bite Swamp 的柱子都到 12，因此它们的数量相同；Reptile Creek 为 9，Chomp Lake 为 6。

**Confidence and progress:** reading bar height：medium；reading scale between tick marks：needs review。

### 2026-08-24 — Stem-and-leaf plots

**Source or activity:** Khan Academy videos and exercises on the purpose and reading of stem-and-leaf plots.

**What was learned:** stem-and-leaf plot 把定量数据按位值拆成 stem 和 leaf；它既能显示分布形状，又保留每个具体观测值。必须先读 key，例如 (4|0=40)。

**Questions:** “What is a stem-and-leaf plot?” “What does it use for?” “How do I find an exact value?”

**Correction:** 不是把 stem 和 leaf 当作两个独立数字，而是按照 key 合并。要找某个值，就定位它的 stem，再检查对应的 leaf；要回答大于、小于或等于的问题，要逐个读出观测值。

**Evidence:** key (4|0=40) 时，(4|7=47)；若某行只有一个对应 leaf，那么该值出现一次。

**Confidence and progress:** reading exact values：medium；从完整图形计算 median/range：needs practice。

### 2026-08-24 — Histograms

**Source or activity:** Khan Academy videos and exercises on creating and interpreting histograms.

**What was learned:** histogram 把 quantitative values 分成连续的 bins/intervals；柱子相连，因为区间有数值连续性。柱高表示落在该区间的观测数，不能把一个柱顶当成一个具体原始值。

**Questions:** “How do I create a histogram?” “How do I read the current histogram?”

**Correction:** 先确定 bin width 和边界，再数每个区间的 frequency；读图时要说明“这个区间内有多少个观测”，而不是假装知道每个观测的精确值。由 histogram 找 median 或 range 通常只能得到区间或近似值。

**Evidence:** 在 minting-year histogram 中，median 只能定位到 1990–2000 的区间；range 约由最早和最晚的非空 bins 估计，约为 110 年。

**Confidence and progress:** bins 与柱子：medium；从分组图定位 median：partly understood。

### 2026-08-24 — Shape, clusters, gaps, peaks, and outliers

**Source or activity:** Khan Academy videos and exercises on classifying and describing distributions.

**What was learned:**

- symmetric：中心两侧大致呈镜像；
- right-skewed：右侧有较长尾巴；left-skewed：左侧有较长尾巴；
- uniform：各区间频数大致相近；
- cluster：数据集中在某个区域；
- gap：某个区间没有或几乎没有数据；
- peak：频数明显较高的区域；
- outlier：远离主要数据群的观测值，需要进一步检查。

**Questions:** “Why is the current graph symmetric?” “What is skewed?” “What do the lines, dots, and square represent?”

**Correction:** symmetric 看的是左右整体形状，不是要求每个点完全相同；skew 的方向由 tail 的方向命名，不是由数据堆积最多的一侧命名；线、点和方框的意义取决于 display，box plot 中方框表示中间 50%，线通常表示 median 或 whisker。

**Evidence:** 先找主要数据群，再看左右尾巴、空白区和远离主体的值，最后用 shape/center/spread/outliers 描述，而不是只说“图形高”或“图形低”。

**Confidence and progress:** symmetric/skewed/uniform：medium；outlier 与 graph-specific symbols：partly understood。

### 2026-08-24 — Median, quartiles, range, and spread

**Source or activity:** Khan Academy, “Describing a distribution” and related questions.

**What was learned:**

- median 要先把观测值从小到大排序；
- 奇数个数据取中间一个，偶数个数据取中间两个的平均值；
- quartiles 把排序后的数据分成四部分；
- (Q_2) 就是 median，(Q_1) 是下半部分的中位数，(Q_3) 是上半部分的中位数；
- range 是最大值减最小值；
- spread 描述数据分散得多不多，常用 range、IQR 或 standard deviation 表示。

**Questions:** “The numbers do not have order—how do we find the 25th and 26th?” “How can we find the 25th on the graph?” “What is a quartile?” “What does spread mean?”

**Correction:** 图上的点虽然看起来没有编号，但要按横轴数值从小到大排序；如果有 50 个观测值，第 25 和第 26 个位置就是中间两个位置。若只有 grouped histogram，不能直接知道精确的第 25 个值，只能定位到一个 bin 并作近似判断。

**Evidence:** 对 24 个已排序观测值，中间位置是第 12 和第 13 个，median 是这两个值的平均数。

**Confidence and progress:** median：medium；quartile、IQR 和 spread：partly understood。

### 2026-08-24 — Egg-carton dot plot and correction through recounting

**Source or activity:** Khan Academy dot plot about the number of intact eggs in cartons.

**Starting mistake:** 一开始没有正确数出 11 eggs 位置的重叠 dots，因此把 median 判断成 12。

**Question or confusion:** “There are more than 1 carton that has 11 intact eggs.”

**Correction:** 一个 dot 代表一个 carton；同一个横坐标上垂直堆叠的 dots 必须全部计数。重新数出 24 个 cartons 后，第 12 个值为 11，第 13 个值为 12，所以 median 是 ((11+12)/2=11.5)，不是 12。

**What was learned:** 计算 dot plot 的 median 前，先把每个横坐标的 dot 数量写成 frequency，再累加 frequency 找中间位置。

**Confidence and progress:** recounting stacked dots：improved；median from dot plot：partly understood to applied。

### 2026-08-24 — Comparing distributions

**Source or activity:** Khan Academy comparison video and exercises on Olympic times, city temperatures, and winter temperatures.

**What was learned:** 比较两组分布时，要比较同样的四个方面：shape、center、spread、outliers；还要保留单位和原始情境。

**Questions:** “What does ‘varied more noticeably in Washington, D.C.’ mean?” “Does a lower time mean faster?” “Does overlap change the conclusion?”

**Correction:** “varied more” 指 spread 更大，不是平均值更高；短跑时间越低通常表示越快；“on average” 只比较 center，不能推出每一天或每个观测都更高/更低；两组有 overlap 时，不能说一组在每个观测上都超过另一组。

**Evidence:** Olympic final times were lower on average, while the final also had greater spread; city temperature comparisons required separating median/center from spread.

**Confidence and progress:** identifying center and spread in comparisons：medium；writing a complete comparison sentence：needs practice。

### 2026-08-24 — Unit-test synthesis

**Source or activity:** Khan Academy AP Statistics Unit 1–2 unit test, including the nickel minting-year histogram.

**What was learned:** 综合题要求同时读变量、图表、shape、center、spread 和 potential outliers；分组图上的数值通常是近似的，结论必须带“about/approximately”。

**Evidence:** nickel-year histogram was interpreted as left-skewed; median was located in the 1990–2000 interval; range was estimated at about 110 years; some extreme values were treated as potential outliers rather than automatically declared errors.

**Current difficulty:** 看到图形后能说出大意，但在 grouped bars、stacked dots、quartile positions 和 outlier 判断上仍需要逐步核对。

**Progress:** Unit 1 foundations and basic displays：partly understood to applied；Unit 2 displays and descriptive language：partly understood；independent written synthesis：not yet consistent。

## Questions and confusions to revisit

- [ ] 如何从 two-way table 准确判断 joint、marginal 和 conditional percentage 的分母？
- [ ] 如何用 conditional distributions 判断 association，并说明为什么不能直接证明 causation？
- [ ] 什么时候使用 mean/standard deviation，什么时候使用 median/IQR？
- [ ] 如何从 histogram 的 bins 近似定位 median、range 和 potential outliers？
- [ ] 如何在 stack 很高的 dot plot 中快速而准确地累计频数？
- [ ] 如何区分 mode、frequency、median、center 和 spread？
- [ ] 如何把“看图得到的印象”写成带变量、单位、群体和限制条件的统计结论？

## Current confidence and evidence

| Area | Current understanding | Evidence |
|---|---|---|
| Individuals and variables | Medium | 能区分 student、student name、teacher 和 absences |
| Categorical data and bar graphs | Medium | 能读柱高、最高/最低类别和相同频数 |
| Two-way tables | Low to medium | 能找到总计 160，知道要看分母 |
| Stem-and-leaf plots | Medium | 能使用 key 读取具体值 |
| Histograms | Medium | 能解释 bins、frequency 和近似值 |
| Distribution shape | Medium | 能识别 symmetric、skewed、uniform、cluster、gap |
| Median and quartiles | Medium | 知道排序和偶数个数据取中间两值平均 |
| Range, IQR, and spread | Low to medium | 知道 range 与 spread 的基本意义 |
| Comparing distributions | Medium | 能区分 average claim 与 every-observation claim |
| Association and causation | Low | 记住 association 不等于 causation |
