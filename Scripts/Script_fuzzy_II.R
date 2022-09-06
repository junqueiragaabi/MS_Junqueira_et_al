##FuzzyQ sem as 5 sp

commom_fuzzy_II <- df_commum_f %>%
            select(-c(PSUB_2:GPSE)) %>%
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


#Common FuzzyQ - II
dbrda_VIII <- vegan::capscale(diatom_commum_soren_f_II ~ Mesohabitat * Grazer * Substrate,
            data = df_richness)

anova(dbrda_VIII, by = "terms", permutations = perm_block)


#Rare FuzzyQ - II
dbrda_VIV <- vegan::capscale(diatom_rare_soren_f ~ Mesohabitat * Grazer * Substrate,
            data = df_richness)

anova(dbrda_VIV, by = "terms", permutations = perm_block)
