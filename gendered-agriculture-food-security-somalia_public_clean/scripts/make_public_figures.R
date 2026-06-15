# Recreate selected public figures from aggregate outputs only.
# This script does not require raw household microdata.

required_packages <- c("readr", "dplyr", "tidyr", "ggplot2", "stringr")
missing_packages <- required_packages[!required_packages %in% rownames(installed.packages())]
if (length(missing_packages) > 0) {
  stop("Please install missing packages first: ", paste(missing_packages, collapse = ", "))
}

library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(stringr)

root <- getwd()
data_dir <- file.path(root, "data", "derived_outputs")
fig_dir <- file.path(root, "figures")
dir.create(fig_dir, showWarnings = FALSE, recursive = TRUE)

crop <- read_csv(file.path(data_dir, "table_3_crop_market_indicators.csv"), show_col_types = FALSE)
models <- read_csv(file.path(data_dir, "table_5_adjusted_associations_female_operator.csv"), show_col_types = FALSE)

# Figure: crop categories by operator sex
crop_long <- crop %>%
  select(operator_sex, grains_pct, legumes_pct, vegetables_tubers_pct, fruits_nuts_pct, animal_feed_pct) %>%
  pivot_longer(-operator_sex, names_to = "crop_category", values_to = "percent") %>%
  mutate(crop_category = recode(crop_category,
                                grains_pct = "Grains",
                                legumes_pct = "Legumes",
                                vegetables_tubers_pct = "Vegetables/tubers",
                                fruits_nuts_pct = "Fruits/nuts",
                                animal_feed_pct = "Animal feed"))

p_crop <- ggplot(crop_long, aes(x = percent, y = reorder(crop_category, percent), fill = operator_sex)) +
  geom_col(position = position_dodge(width = 0.75), width = 0.65) +
  labs(title = "Crop categories by primary land-operator sex",
       x = "Weighted percentage of agricultural land-operating households",
       y = NULL,
       fill = "Operator sex") +
  theme_minimal(base_size = 12)

ggsave(file.path(fig_dir, "crop_categories_by_operator_sex.png"), p_crop, width = 9, height = 5, dpi = 300)

# Figure: adjusted associations
parse_est <- function(x) {
  est <- as.numeric(str_extract(x, "^[0-9.]+"))
  ci <- str_match(x, "\\(([^-]+)-([^\\)]+)\\)")
  tibble(estimate = est, conf_low = as.numeric(ci[,2]), conf_high = as.numeric(ci[,3]))
}

model_plot <- bind_cols(models, bind_rows(lapply(models$`Estimate (95% CI)`, parse_est))) %>%
  mutate(outcome = factor(Outcome, levels = rev(Outcome)))

p_model <- ggplot(model_plot, aes(x = estimate, y = outcome)) +
  geom_vline(xintercept = 1, linetype = "dashed") +
  geom_errorbarh(aes(xmin = conf_low, xmax = conf_high), height = 0.18) +
  geom_point(size = 2.6) +
  scale_x_log10() +
  labs(title = "Adjusted associations for female primary land operator",
       x = "Adjusted OR / IRR, log scale",
       y = NULL) +
  theme_minimal(base_size = 12)

ggsave(file.path(fig_dir, "adjusted_associations.png"), p_model, width = 8.5, height = 5.8, dpi = 300)
