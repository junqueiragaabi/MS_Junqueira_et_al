diatom_comp_t <- df_richness %>%
            select(-c(Block:Richness_R_Fuzzy_II))


diatom_total_hell <- labdsv::hellinger(diatom_comp_t)
diatom_total_bray <- vegan::vegdist(diatom_total_hell, method = "bray")
diatom_total_soren <- vegan::vegdist(diatom_total_hell, method = "bray", binary = TRUE)


diatom_comp_c <- df_commum_ra %>%
            select(-c(Block:Richness_R_Fuzzy_II))

diatom_commum_hell <- labdsv::hellinger(diatom_comp_c)
diatom_commum_bray <- vegan::vegdist(diatom_commum_hell, method = "bray")
diatom_commum_soren <- vegan::vegdist(diatom_commum_hell, method = "bray", binary = TRUE)


diatom_comp_r <- df_rare_ra %>%
            select(-c(Block:Richness_R_Fuzzy_II))

diatom_rare_hell <- labdsv::hellinger(diatom_rare_c)
diatom_rare_bray <- vegan::vegdist(diatom_rare_hell, method = "bray")
diatom_rare_soren <- vegan::vegdist(diatom_rare_hell, method = "bray", binary = TRUE)
