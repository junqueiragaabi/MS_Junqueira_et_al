library(tidyverse)
library(here)
library(vegan)
library(labdsv)
library(FuzzyQ)
library(showtext)
library(patchwork)
library(ggforce)

df_richness <- read.csv(here::here("Data", "Data_diatoms_composition.csv"),
    header = TRUE, sep = ";", dec = ",")

df_commum_f <- read.csv(here::here("Data", "Data_diatoms_fuzzyq_common.csv"),
    header = TRUE, sep = ";", dec = ",")

df_rare_f <- read.csv(here::here("Data", "Data_diatoms_fuzzyq_rare.csv"),
    header = TRUE, sep = ";", dec = ",")

df_factors <- df_richness %>%
    select(Block:Replication)
