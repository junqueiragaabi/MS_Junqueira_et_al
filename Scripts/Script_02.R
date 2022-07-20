#####Community Total

sp_total <- aov(df_richness$Richness_T ~df_richness$Mesohabitat*df_richness$Grazer*df_richness$Substrate + 
        Error(as.factor(df_richness$Block)/df_richness$Grazer),
        data = df_richness)

summary(sp_total)

p <- c(0.132, 0.610, 0.567, 0.000301, 0.768460, 0.153809, 0.091296)
p.adjust(p, "bonferroni", n = length(p))

########Gaston
## Common
sp_common_I <- aov(df_richness$Richness_C_RA ~df_richness$Mesohabitat*df_richness$Grazer*df_richness$Substrate + 
        Error(as.factor(df_richness$Block)/df_richness$Grazer),
        data = df_richness)

summary(sp_common_I)

p <- c(0.0672, 0.426, 0.761, 0.00493, 1.00000, 0.61394, 0.02886)
p.adjust(p, "bonferroni", n = length(p))

##Rare
sp_rare_I <- aov(df_richness$Richness_R_RA ~df_richness$Mesohabitat*df_richness$Grazer*df_richness$Substrate + 
        Error(as.factor(df_richness$Block)/df_richness$Grazer),
        data = df_richness)

summary(sp_rare_I)

p <- c(0.237, 1.000, 0.212, 0.00514, 0.72366, 0.16931, 0.63786)
p.adjust(p, "bonferroni", n = length(p))

########FuzzyQ com 5 sp
## Common

sp_common_II <- aov(df_richness$Richness_C_Fuzzy_I ~df_richness$Mesohabitat*df_richness$Grazer*df_richness$Substrate + 
        Error(as.factor(df_richness$Block)/df_richness$Grazer),
        data = df_richness)

summary(sp_common_II)

p <- c(0.0177, 0.487, 0.487, 0.00183, 0.94261, 0.71943, 0.14416)
p.adjust(p, "bonferroni", n = length(p))

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
