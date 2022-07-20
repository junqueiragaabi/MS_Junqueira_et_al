library(tidyverse)
library(ptsuite)

df_diatom <- read.csv(here::here("Data", "Data_diatoms_composition.csv"),
    header = TRUE, sep = ";", dec = ",")

df_diatom_pivot <- df_diatom %>%
    select(Replication:last_col()) %>%
    pivot_longer(!Replication, names_to = "sp", values_to = "abundance") %>%
    group_by(sp) %>%
    summarise(total = sum(abundance))

diatom_vector <- df_diatom_pivot$total    

pareto_qq_test(diatom_vector) #não é pareto distribution
pareto_test(diatom_vector) #não é pareto distribution

df_diatom_pool <- df_diatom %>%
    filter(Mesohabitat == "Pool") %>%
    select(Replication:last_col()) %>%
    pivot_longer(!Replication, names_to = "sp", values_to = "abundance") %>%
    group_by(sp) %>%
    summarise(total = sum(abundance)) %>%
    filter(total > 0)

diatom_pool <- df_diatom_pool$total

pareto_qq_test(diatom_pool) #não é pareto distribution
pareto_test(diatom_pool) #não é pareto distribution

df_diatom_pool_grazer <- df_diatom %>%
    filter(Mesohabitat == "Pool") %>%
    filter(Grazer == "Presence") %>%
    select(Replication:last_col()) %>%
    pivot_longer(!Replication, names_to = "sp", values_to = "abundance") %>%
    group_by(sp) %>%
    summarise(total = sum(abundance)) %>%
    filter(total > 0)

diatom_pool_grazer <- df_diatom_pool_grazer$total

pareto_qq_test(diatom_pool_grazer) #não é pareto distribution
pareto_test(diatom_pool_grazer) #não é pareto distribution

df_diatom_pool_no_grazer <- df_diatom %>%
    filter(Mesohabitat == "Pool") %>%
    filter(Grazer == "Absence") %>%
    select(Replication:last_col()) %>%
    pivot_longer(!Replication, names_to = "sp", values_to = "abundance") %>%
    group_by(sp) %>%
    summarise(total = sum(abundance)) %>%
    filter(total > 0)

diatom_pool_no_grazer <- df_diatom_pool_no_grazer$total

pareto_qq_test(diatom_pool_no_grazer) #não é pareto distribution
pareto_test(diatom_pool_no_grazer) #não é pareto distribution

df_diatom_riffle <- df_diatom %>%
    filter(Mesohabitat == "Riffle") %>%
    select(Replication:last_col()) %>%
    pivot_longer(!Replication, names_to = "sp", values_to = "abundance") %>%
    group_by(sp) %>%
    summarise(total = sum(abundance)) %>%
    filter(total > 0)

diatom_riffle <- df_diatom_riffle$total

pareto_qq_test(diatom_riffle) #não é pareto distribution
pareto_test(diatom_riffle) #não é pareto distribution

df_diatom_riffle_grazer <- df_diatom %>%
    filter(Mesohabitat == "Riffle") %>%
    filter(Grazer == "Presence") %>%
    select(Replication:last_col()) %>%
    pivot_longer(!Replication, names_to = "sp", values_to = "abundance") %>%
    group_by(sp) %>%
    summarise(total = sum(abundance)) %>%
    filter(total > 0)

diatom_riffle_grazer <- df_diatom_riffle_grazer$total

pareto_qq_test(diatom_riffle_grazer) #não é pareto distribution
pareto_test(diatom_riffle_grazer) #É PARETO DISTRIBUTION

df_diatom_riffle_no_grazer <- df_diatom %>%
    filter(Mesohabitat == "Riffle") %>%
    filter(Grazer == "Absence") %>%
    select(Replication:last_col()) %>%
    pivot_longer(!Replication, names_to = "sp", values_to = "abundance") %>%
    group_by(sp) %>%
    summarise(total = sum(abundance)) %>%
    filter(total > 0)

diatom_riffle_no_grazer <- df_diatom_riffle_no_grazer$total

pareto_qq_test(diatom_riffle_no_grazer) #não é pareto distribution
pareto_test(diatom_riffle_no_grazer) #NÃO É PARETO DISTRIBUTION
