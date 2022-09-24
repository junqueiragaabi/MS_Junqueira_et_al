library(tidyverse)
library(here)
library(vegan)
library(labdsv)
library(FuzzyQ)
library(showtext)
library(patchwork)
library(ggforce)
library(hrbrthemes)
library(waffle)
library(ggthemes)
library(ggtext)
library(ggplotify)


df_diatom <- read.csv(here::here("Data", "Data_diatoms_composition.csv"),
    header = TRUE, sep = ";", dec = ",")

df_common_f <- read.csv(here::here("Data", "Data_diatoms_fuzzyq_common.csv"),
    header = TRUE, sep = ";", dec = ",")

df_rare_f <- read.csv(here::here("Data", "Data_diatoms_fuzzyq_rare.csv"),
    header = TRUE, sep = ";", dec = ",")

df_six_common <- read.csv(here::here("Data", "Data_diatoms_six_common.csv"),
    header = TRUE, sep = ";", dec = ",")

df_factors <- df_diatom %>%
    select(Block:Replication)


##The end of the script##