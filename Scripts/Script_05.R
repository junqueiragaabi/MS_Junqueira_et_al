
perm_block <- permute::how(within = Within(type = "free"),
                  plots = Plots(strata = interaction(as.factor(df_richness$Grazer), as.factor(df_richness$Mesohabitat)),type = "free"),
                  block = as.factor(df_richness$Mesohabitat), nperm = 999)



#########Bray-Curtis

dbrda_I <- vegan::capscale(diatom_total_bray ~ Mesohabitat * Grazer * Substrate,
            data = df_richness)

anova(dbrda_I, by = "terms", permutations = perm_block)

#Common Rank Abundance
dbrda_II <- vegan::capscale(diatom_commum_bray ~ Mesohabitat * Grazer * Substrate,
            data = df_richness)

anova(dbrda_II, by = "terms", permutations = perm_block)

#Common FuzzyQ
dbrda_III <- vegan::capscale(diatom_commum_bray_f ~ Mesohabitat * Grazer * Substrate,
            data = df_richness)

anova(dbrda_III, by = "terms", permutations = perm_block)

#Rare Rank Abundance
dbrda_IV <- vegan::capscale(diatom_rare_bray ~ Mesohabitat * Grazer * Substrate,
            data = df_richness)

anova(dbrda_IV, by = "terms", permutations = perm_block)

#Common FuzzyQ
dbrda_V <- vegan::capscale(diatom_rare_bray_f ~ Mesohabitat * Grazer * Substrate,
            data = df_richness)

anova(dbrda_V, by = "terms", permutations = perm_block)


######### Sorensen

#Common FuzzyQ
dbrda_VI <- vegan::capscale(diatom_commum_soren_f ~ Mesohabitat * Grazer * Substrate,
            data = df_richness)

anova(dbrda_VI, by = "terms", permutations = perm_block)


#Rare FuzzyQ
dbrda_VII <- vegan::capscale(diatom_rare_soren_f ~ Mesohabitat * Grazer * Substrate,
            data = df_richness)

anova(dbrda_VII, by = "terms", permutations = perm_block)

#Common FuzzyQ - II
dbrda_VIII <- vegan::capscale(diatom_commum_bray_f_II ~ Mesohabitat * Grazer * Substrate,
            data = df_richness)

anova(dbrda_VIII, by = "terms", permutations = perm_block)


#Rare FuzzyQ - II
dbrda_VIV <- vegan::capscale(diatom_rare_bray_f ~ Mesohabitat * Grazer * Substrate,
            data = df_richness)

anova(dbrda_VIV, by = "terms", permutations = perm_block)
