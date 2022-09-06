diatom_comp_t <- df_richness %>%
            select(-c(Block:Richness_R_Fuzzy_II))


diatom_total_hell <- labdsv::hellinger(diatom_comp_t)
diatom_total_bray <- vegan::vegdist(diatom_total_hell, method = "bray")
diatom_total_soren <- vegan::vegdist(diatom_total_hell, method = "bray", binary = TRUE)

diatom_comp_c_fuzzy <- df_commum_f %>%
              select(-c(Block:Replication))

diatom_commum_hell_f <- labdsv::hellinger(diatom_comp_c_fuzzy)
diatom_commum_bray_f <- vegan::vegdist(diatom_commum_hell_f, method = "bray")
diatom_commum_soren_f<- vegan::vegdist(diatom_commum_hell_f, method = "bray", binary = TRUE)

diatom_comp_r_fuzzy <- df_rare_f %>%
              select(-c(Block:Replication))

diatom_rare_hell_f <- labdsv::hellinger(diatom_comp_r_fuzzy)
diatom_rare_bray_f <- vegan::vegdist(diatom_rare_hell_f, method = "bray")
diatom_rare_soren_f<- vegan::vegdist(diatom_rare_hell_f, method = "bray", binary = TRUE)


##FuzzyQ sem as 5 sp

commom_fuzzy_II <- df_commum_f %>%
            select(-c(HUCO:EINT)) %>%
            select(-c(Block:Replication))

diatom_commum_hell_f_II <- labdsv::hellinger(commom_fuzzy_II)
diatom_commum_bray_f_II <- vegan::vegdist(diatom_commum_hell_f_II, method = "bray")
diatom_commum_soren_f_II<- vegan::vegdist(diatom_commum_hell_f_II, method = "bray", binary = TRUE)

sp_5 <- df_commum_f %>%
        select(PSUB_2:GPSE)


rare_fuzzy_II <- cbind(df_rare_f, sp_5) %>%
          select(-c(Block:Replication))

diatom_rare_hell_f_II <- labdsv::hellinger(rare_fuzzy_II)
diatom_rare_bray_f_II <- vegan::vegdist(diatom_rare_hell_f_II, method = "bray")
diatom_rare_soren_f_II<- vegan::vegdist(diatom_rare_hell_f_II, method = "bray", binary = TRUE)

