## Script for db-RDA
## Mesohabitat -- Pool (5) x Riffle (5)
## Grazer -- Presence (10) x Absence (10)
## Substrate -- Rough (20) x Smooth (20)
## Bray-Curtis - abundance data
## Sorensen - presence and absence


##Restricted permutation --------------------

perm_block <- permute::how(within = Within(type = "free"),
                  plots = Plots(strata = interaction(as.factor(df_diatom$Grazer), as.factor(df_diatom$Mesohabitat)),type = "free"),
                  block = as.factor(df_diatom$Mesohabitat), nperm = 999)

## Blocks: Mesohabitat -- Pool (5) x Riffle (5)
## Plots: Interaction of Grazer * Substrate

#####Community Total-------------------------

#Sorensen

dbrda_I <- vegan::capscale(diatom_total_soren ~ Mesohabitat * Grazer * Substrate,
            data = df_diatom)

set.seed(1)
anova(dbrda_I, by = "terms", permutations = perm_block)

#Bray-Curtis

dbrda_IV <- vegan::capscale(diatom_total_bray ~ Mesohabitat * Grazer * Substrate,
            data = df_diatom)

set.seed(4)
anova(dbrda_IV, by = "terms", permutations = perm_block)

#####Common species---------------------------

#Sorensen

dbrda_II <- vegan::capscale(diatom_common_soren_f ~ Mesohabitat * Grazer * Substrate,
            data = df_diatom)

set.seed(2)
anova(dbrda_II, by = "terms", permutations = perm_block)

#Bray-Curtis

dbrda_V <- vegan::capscale(diatom_commum_bray_f ~ Mesohabitat * Grazer * Substrate,
            data = df_diatom)

set.seed(5)
anova(dbrda_V, by = "terms", permutations = perm_block)

#####Rare species---------------------------

#Sorensen

dbrda_III <- vegan::capscale(diatom_rare_soren_f ~ Mesohabitat * Grazer * Substrate,
            data = df_diatom)

set.seed(3)
anova(dbrda_III, by = "terms", permutations = perm_block)

#Bray-Curtis

dbrda_VI <- vegan::capscale(diatom_rare_bray_f ~ Mesohabitat * Grazer * Substrate,
            data = df_diatom)

set.seed(6)
anova(dbrda_VI, by = "terms", permutations = perm_block)


##The end of the script##