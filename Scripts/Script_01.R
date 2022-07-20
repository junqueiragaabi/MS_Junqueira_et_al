library(tidyverse)
library(here)
library(vegan)
library(BiodiversityR)
library(labdsv)

df_richness <- read.csv(here::here("Data", "Data_diatoms_composition.csv"),
    header = TRUE, sep = ";", dec = ",")

df_commum_ra <- read.csv(here::here("Data", "Data_diatoms_rank_abundance_common.csv"),
    header = TRUE, sep = ";", dec = ",")

df_rare_ra <- read.csv(here::here("Data", "Data_diatoms_rank_abundance_rare.csv"),
    header = TRUE, sep = ";", dec = ",")

df_commum_f <- read.csv(here::here("Data", "Data_diatoms_fuzzyq_common.csv"),
    header = TRUE, sep = ";", dec = ",")

df_rare_f <- read.csv(here::here("Data", "Data_diatoms_fuzzyq_rare.csv"),
    header = TRUE, sep = ";", dec = ",")


