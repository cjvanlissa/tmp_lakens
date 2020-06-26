# In this file, write the R-code necessary to load your original data file
# (e.g., an SPSS, Excel, or SAS-file), and convert it to a data.frame. Then,
# use the function open_data(your_data_frame) or closed_data(your_data_frame)
# to store the data.

library(worcs)
library(dplyr)
library(readxl)
library(tidySEM)


data <- read_excel("c:/tmp/lakens/demo_data.xlsx", na = "NA")

data %>%
  tidy_sem() %>%
  create_scales() -> scales

scales$descriptives

data <- cbind(data, scales$scores)

open_data(data)