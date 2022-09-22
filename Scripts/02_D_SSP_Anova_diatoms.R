## Script for split-split-plot-Anova
## Main plot: Mesohabitat -- Pool (5) x Riffle (5)
## Sub-plot: Grazer -- Presence (10) x Absence (10)
## Sub-sub-plot:Substrate -- Rough (20) x Smooth (20)


#####Community Total-------------------------

#Anova
sp_total <- aov(df_diatom$Richness_T ~df_diatom$Mesohabitat*df_diatom$Grazer*df_diatom$Substrate +
        Error(as.factor(df_diatom$Block)/df_diatom$Grazer),
        data = df_diatom)

summary(sp_total)

#Assumptions
sp_total_assum <- aov(df_diatom$Richness_T ~df_diatom$Mesohabitat*df_diatom$Grazer*df_diatom$Substrate,
                 data = df_diatom)

#Normality
qqnorm(sp_total_assum$residuals)

#Homogeneity of variance
plot(sp_total_assum, 1)

#####Common species----------------------------

#Anova
sp_common <- aov(df_diatom$Richness_C_Fuzzy_I ~df_diatom$Mesohabitat*df_diatom$Grazer*df_diatom$Substrate +
        Error(as.factor(df_diatom$Block)/df_diatom$Grazer),
        data = df_diatom)

summary(sp_common)

#Assumptions
sp_common_assum <- aov(df_diatom$Richness_C_Fuzzy_I ~df_diatom$Mesohabitat*df_diatom$Grazer*df_diatom$Substrate,
                 data = df_diatom)

#Normality
qqnorm(sp_common_assum$residuals)

#Homogeneity of variance
plot(sp_common_assum, 1)

#####Rare species------------------------------

#Anova
sp_rare <- aov(df_diatom$Richness_R_Fuzzy_I ~df_diatom$Mesohabitat*df_diatom$Grazer*df_diatom$Substrate +
        Error(as.factor(df_diatom$Block)/df_diatom$Grazer),
        data = df_diatom)

summary(sp_rare)

#Assumptions
sp_rare_assum <- aov(df_diatom$Richness_C_Fuzzy_I ~df_diatom$Mesohabitat*df_diatom$Grazer*df_diatom$Substrate,
                 data = df_diatom)

#Normality
qqnorm(sp_rare_assum$residuals)

#Homogeneity of variance
plot(sp_common_assum, 1)


##The end of the script##