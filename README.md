Evaluating the Impact of the Production Linked Incentive (PLI) Scheme on India's Export Performance: A Difference-in-Differences Analysis
Author: Shashi Kulkarni
Institution: GIPE Pune — MSc Economics
Date: June 2026
Method: Difference-in-Differences (DiD)

Overview
This project estimates the causal impact of India's Production Linked Incentive (PLI) scheme on sectoral export performance using a Two-Way Fixed Effects (TWFE) Difference-in-Differences design. The PLI scheme, launched in March 2020, provides financial incentives of 4–6% on incremental sales to manufacturers in strategically selected sectors.
The analysis compares export trajectories of two PLI-covered sectors (Mobile Manufacturing and Medical Devices) against two non-PLI sectors (Leather Goods and Ceramic Products) over the period 2017–2024.

Research Questions

Did the PLI scheme generate a statistically significant increase in exports of treated sectors relative to control sectors?
Do the pre-treatment export trends satisfy the parallel trends assumption underpinning the DiD framework?


Data
VariableDescriptionSourceExportsAnnual export value (USD millions)DGFT / Ministry of Commerce, Indiatreated=1 for PLI-covered sectors (Mobile Mfg, Medical Devices)PLI Scheme Notificationpost=1 for year >= 2020—log_exportslog(Exports + 1) — dependent variableDerived in R

Panel structure: 4 sectors × 8 years (2017–2024) = 32 observations (balanced)
Treatment cutoff: 2020
Treatment group: Mobile Manufacturing, Medical Devices
Control group: Leather Goods, Ceramic Products


Methodology
Main Model — TWFE DiD
log(Exports_it + 1) = alpha_i + gamma_t + delta*(Treated_i x Post_t) + epsilon_it

alpha_i — Sector fixed effects
gamma_t — Year fixed effects
delta — DiD coefficient (ATT): the causal effect of PLI on log exports
Standard errors clustered at the sector level
Estimated using feols() from the fixest package in R

Event Study (Parallel Trends Test)
log(Exports_it + 1) = alpha_i + gamma_t + SUM_{k != 2019} beta_k*(I[t=k] x Treated_i) + epsilon_it
Reference year: 2019. Pre-treatment coefficients (2017, 2018) tested for significance to validate parallel trends.
Placebo Test
Fake treatment date assigned at 2018. A non-significant placebo coefficient confirms the DiD design is not capturing a spurious pre-existing trend.

Key Results
TestCoefficientStd. Errorp-valueInterpretationMain DiD (delta)0.88010.94590.4208~141% export increase; positive but not significantPlacebo (fake 2018)1.06840.98480.3573Not significant — design validated
Event Study Coefficients
Yearbeta_kp-valueNote2017-1.2760.287Pre-trend: not significant2018-1.3980.268Pre-trend: not significant2019(reference)—Base year2020-0.3230.078COVID-19 disruption2021-0.1850.518Recovery phase2022-0.0540.928Convergence2023+0.1400.848Gradual positive trend2024+0.3670.704Continued upward trend

Pre-treatment coefficients are not statistically significant → parallel trends assumption supported
Post-treatment pattern shows gradual build-up consistent with PLI's 5-year incremental incentive design
Overall model fit: Adjusted R² = 0.95, Within R² = 0.16

R Dependencies
rinstall.packages(c("readxl", "fixest", "dplyr", "ggplot2"))
PackagePurposereadxlLoad Excel datasetfixestTWFE DiD via feols(), event study via iplot()dplyrData wranglingggplot2Visualisation

Limitations

Small sample (32 observations, 4 sector clusters) limits statistical power and makes clustered SE inference unreliable
Control sectors differ substantially from treatment sectors in absolute export scale
Post-2020 period confounded by COVID-19, China+1 supply chain restructuring, and other concurrent policies
TWFE may mask heterogeneous treatment effects across sectors (see Callaway & Sant'Anna, 2021)
