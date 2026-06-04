data <- PLI_DID_Dataset
# Load library
library(ggplot2)

# Line graph
ggplot(data, aes(x = year)) +
  
  geom_line(aes(y = mobile_exports,
                color = "Mobile Manufacturing"),
            linewidth = 1) +
  
  geom_line(aes(y = medical_exports,
                color = "Medical Devices"),
            linewidth = 1) +
  
  geom_line(aes(y = leather_exports,
                color = "Leather Goods"),
            linewidth = 1) +
  
  geom_line(aes(y = ceramic_exports,
                color = "Ceramic Products"),
            linewidth = 1) +
  
  
  labs(title = "Export Trends (2015-2019)",
       x = "Year",
       y = "Export Value",
       color = "Commodity") +
  
  theme_minimal()

library(readxl)
library(fixest)
library(dplyr)

head(data)
summary(data)

df <- PLI_DID_Clean

df <- df %>%
  mutate(
    log_exports = log(Exports + 1)
  )

model <- feols(
  log_exports ~ treated*post |
    sector + year,
  data = df,
  cluster = ~sector
)

summary(model)


##parllel test

event_model <- feols(
  log_exports ~ i(year, treated, ref = 2019) |
    sector + year,
  data = df,
  cluster = ~sector
)

summary(event_model)

iplot(event_model)

##no treatment efect before 2020
#post 2020 the coefficient are negative - covid effect
#gradually coefficents becoming positive

##placebo test

df <- df %>%
  mutate(
    fake_post = ifelse(year >= 2018, 1, 0)
  )

placebo_model <- feols(
  log_exports ~ treated*fake_post |
    sector + year,
  data = df,
  cluster = ~sector
)

summary(placebo_model)

## no fake treatment before 2020

did_plot <- df %>%
  group_by(year, treated) %>%
  summarise(
    avg_exports = mean(log_exports, na.rm = TRUE),
    .groups = "drop"
  )

ggplot(did_plot,
       aes(x = year,
           y = avg_exports,
           color = factor(treated),
           group = treated)) +
  
  geom_line(linewidth = 1.2) +
  geom_point(size = 3) +
  
  geom_vline(xintercept = 2020,
             linetype = "dashed") +
  
  labs(
    title = "Difference-in-Differences Graph",
    subtitle = "PLI Impact on Exports",
    x = "Year",
    y = "Average Log Exports",
    color = "Group"
  ) +
  
  scale_color_manual(
    values = c("blue", "red"),
    labels = c("Control Group", "Treated Group")
  ) +
  
  theme_minimal()
