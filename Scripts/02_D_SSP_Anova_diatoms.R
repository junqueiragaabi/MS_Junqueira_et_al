## Script for split-split-plot-Anova
## Main plot: Mesohabitat -- Pool (5) x Riffle (5)
## Sub-plot: Grazer -- Presence (10) x Absence (10)
## Sub-sub-plot:Substrate -- Rough (20) x Smooth (20)

attach(df_richness)

#####Community Total-------------------------

#Anova
sp_total <- aov(df_richness$Richness_T ~df_richness$Mesohabitat*df_richness$Grazer*df_richness$Substrate +
        Error(as.factor(df_richness$Block)/df_richness$Grazer),
        data = df_richness)

summary(sp_total)

#Assumptions
sp_total_assum <- aov(df_richness$Richness_T ~df_richness$Mesohabitat*df_richness$Grazer*df_richness$Substrate,
                 data = df_richness)

#Normality
qqnorm(sp_total_assum$residuals)

#Homogeneity of variance
plot(sp_total_assum, 1)

#####Common species----------------------------

#Anova
sp_common <- aov(df_richness$Richness_C_Fuzzy_I ~df_richness$Mesohabitat*df_richness$Grazer*df_richness$Substrate +
        Error(as.factor(df_richness$Block)/df_richness$Grazer),
        data = df_richness)

summary(sp_common)

#Assumptions
sp_common_assum <- aov(df_richness$Richness_C_Fuzzy_I ~df_richness$Mesohabitat*df_richness$Grazer*df_richness$Substrate,
                 data = df_richness)

#Normality
qqnorm(sp_common_assum$residuals)

#Homogeneity of variance
plot(sp_common_assum, 1)

#####Rare species------------------------------

#Anova
sp_rare <- aov(df_richness$Richness_R_Fuzzy_I ~df_richness$Mesohabitat*df_richness$Grazer*df_richness$Substrate +
        Error(as.factor(df_richness$Block)/df_richness$Grazer),
        data = df_richness)

summary(sp_rare)

#Assumptions
sp_rare_assum <- aov(df_richness$Richness_C_Fuzzy_I ~df_richness$Mesohabitat*df_richness$Grazer*df_richness$Substrate,
                 data = df_richness)

#Normality
qqnorm(sp_rare_assum$residuals)

#Homogeneity of variance
plot(sp_common_assum, 1)


##The end of the script##