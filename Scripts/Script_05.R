
perm_block <- permute::how(within = Within(type = "free"),
                  plots = Plots(strata = interaction(as.factor(df_richness$Grazer), as.factor(df_richness$Mesohabitat)),type = "free"),
                  block = as.factor(df_richness$Mesohabitat), nperm = 999)

################ Sorensen

###Total community
dbrda_I <- vegan::capscale(diatom_total_soren ~ Mesohabitat * Grazer * Substrate,
            data = df_richness)

set.seed(1)
anova(dbrda_I, by = "terms", permutations = perm_block)

###Common set community
dbrda_II <- vegan::capscale(diatom_commum_soren_f ~ Mesohabitat * Grazer * Substrate,
            data = df_richness)

set.seed(2)
anova(dbrda_II, by = "terms", permutations = perm_block)

###Rare set community
dbrda_III <- vegan::capscale(diatom_rare_soren_f ~ Mesohabitat * Grazer * Substrate,
            data = df_richness)

set.seed(3)
anova(dbrda_III, by = "terms", permutations = perm_block)


#########Bray-Curtis

###Total community
dbrda_IV <- vegan::capscale(diatom_total_bray ~ Mesohabitat * Grazer * Substrate,
            data = df_richness)

set.seed(4)
anova(dbrda_IV, by = "terms", permutations = perm_block)


###Common set community
dbrda_V <- vegan::capscale(diatom_commum_bray_f ~ Mesohabitat * Grazer * Substrate,
            data = df_richness)

set.seed(5)
anova(dbrda_V, by = "terms", permutations = perm_block)


###Rare set community
dbrda_VI <- vegan::capscale(diatom_rare_bray_f ~ Mesohabitat * Grazer * Substrate,
            data = df_richness)

set.seed(6)
anova(dbrda_VI, by = "terms", permutations = perm_block)

