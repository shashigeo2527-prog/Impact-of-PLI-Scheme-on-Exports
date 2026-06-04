Project Overview

This project evaluates the impact of India’s Production Linked Incentive (PLI) Scheme on export performance using a Difference-in-Differences (DiD) framework.

The study compares:

Treatment Sectors (PLI-covered):
Mobile Manufacturing
Medical Devices

with

Control Sectors (Non-PLI):
Leather Goods
Ceramic Products

over the period 2017–2024.

The objective is to estimate whether the introduction of the PLI scheme in 2020 led to a measurable increase in exports in treated sectors relative to untreated sectors.

Research Questions
Did the PLI scheme significantly increase exports in treated sectors?
Do the treatment and control groups satisfy the parallel trends assumption required for Difference-in-Differences analysis?
Methodology
Econometric Framework

The project uses a Two-Way Fixed Effects (TWFE) Difference-in-Differences model.

Model Specification
log(Exports
it
	​

+1)=α
i
	​

+γ
t
	​

+δ(Treated
i
	​

×Post
t
	​

)+ϵ
it
	​


Where:

α
i
	​

 = sector fixed effects
γ
t
	​

 = year fixed effects
Treated
i
	​

 = PLI-covered sectors
Post
t
	​

 = post-2020 period
δ = treatment effect (ATT)
Diagnostic Tests

The project includes multiple robustness checks:

1. Event Study / Parallel Trends Test
Tests whether treatment and control sectors followed similar trends before 2020.
2. Placebo Test
Assigns a fake treatment year (2018) to verify that the estimated effect is not driven by pre-existing trends.
Data
Source
DGFT / Ministry of Commerce and Industry, Government of India
Variables
Variable	Description
exports	Annual export value (USD Mn)
treated	=1 for PLI sectors
post	=1 for years ≥ 2020
log_exports	log(exports + 1)
Time Period

2017–2024

Observations

32 panel observations

Key Findings
Main DiD Result

Estimated treatment effect:

δ=0.88

Approximate interpretation:

PLI-associated export increase ≈ 141%
Computed as:
e
0.88
−1
Statistical Significance
p-value = 0.42
Result is not statistically significant at conventional levels due to the small sample size.
Event Study Findings
No significant pre-treatment divergence.
Supports the parallel trends assumption.
Post-2020 effects gradually become more positive over time.
Placebo Test
Fake treatment year produces insignificant results.
Supports validity of the DiD design.
