#####Community Total
attach(df_richness)

sp_total <- aov(df_richness$Richness_T ~df_richness$Mesohabitat*df_richness$Grazer*df_richness$Substrate +
        Error(as.factor(df_richness$Block)/df_richness$Grazer),
        data = df_richness)

summary(sp_total)

########FuzzyQ com 5 sp
## Common

sp_common_II <- aov(df_richness$Richness_C_Fuzzy_I ~df_richness$Mesohabitat*df_richness$Grazer*df_richness$Substrate +
        Error(as.factor(df_richness$Block)/df_richness$Grazer),
        data = df_richness)

summary(sp_common_II)

##Rare
sp_rare_II <- aov(df_richness$Richness_R_Fuzzy_I ~df_richness$Mesohabitat*df_richness$Grazer*df_richness$Substrate +
        Error(as.factor(df_richness$Block)/df_richness$Grazer),
        data = df_richness)
summary(sp_rare_II)

########FuzzyQ sem 5 sp

## Common
sp_common_III <- aov(df_richness$Richness_C_Fuzzy_II ~df_richness$Mesohabitat*df_richness$Grazer*df_richness$Substrate +
        Error(as.factor(df_richness$Block)/df_richness$Grazer),
        data = df_richness)
summary(sp_common_III)

##Rare
sp_rare_III <- aov(df_richness$Richness_R_Fuzzy_II ~df_richness$Mesohabitat*df_richness$Grazer*df_richness$Substrate +
        Error(as.factor(df_richness$Block)/df_richness$Grazer),
        data = df_richness)

summary(sp_rare_III)


teste_1<- aov(df_richness$Richness_C_RA ~df_richness$Mesohabitat*df_richness$Grazer*df_richness$Substrate +
        Error(as.factor(df_richness$Block)/df_richness$Grazer),
        data = df_richness)

summary(teste_1)
