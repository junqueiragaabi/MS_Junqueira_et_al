df_commum_ra <- read.csv(here::here("Data", "Data_diatoms_rank_abundance_common.csv"),
    header = TRUE, sep = ";", dec = ",")

df_rare_ra <- read.csv(here::here("Data", "Data_diatoms_rank_abundance_rare.csv"),
    header = TRUE, sep = ";", dec = ",")


diatom_comp_c <- df_commum_ra %>%
            select(-c(Block:Richness_R_Fuzzy_II))

diatom_commum_hell <- labdsv::hellinger(diatom_comp_c)
diatom_commum_bray <- vegan::vegdist(diatom_commum_hell, method = "bray")
diatom_commum_soren <- vegan::vegdist(diatom_commum_hell, method = "bray", binary = TRUE)


diatom_comp_r <- df_rare_ra %>%
            select(-c(Block:Richness_R_Fuzzy_II))

diatom_rare_hell <- labdsv::hellinger(diatom_comp_r)
diatom_rare_bray <- vegan::vegdist(diatom_rare_hell, method = "bray")
diatom_rare_soren <- vegan::vegdist(diatom_rare_hell, method = "bray", binary = TRUE)


#Common Rank Abundance
dbrda_II <- vegan::capscale(diatom_commum_bray ~ Mesohabitat * Grazer * Substrate,
            data = df_richness)

anova(dbrda_II, by = "terms", permutations = perm_block)

#Rare Rank Abundance
dbrda_IV <- vegan::capscale(diatom_rare_bray ~ Mesohabitat * Grazer * Substrate,
            data = df_richness)

anova(dbrda_IV, by = "terms", permutations = perm_block)