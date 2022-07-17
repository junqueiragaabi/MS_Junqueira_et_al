View(df_richness)

head(df_richness)

sp_common <- aov(df_richness$Richness_C_RA ~df_richness$Mesohabitat*df_richness$Grazer*df_richness$Substrate + 
        Error(as.factor(df_richness$Block)/df_richness$Grazer),
        data = df_richness)

summary(sp_common)
sp_common <- aov(df_richness$Richness_C_Fuzzy_I ~df_richness$Mesohabitat*df_richness$Grazer*df_richness$Substrate + 
        Error(as.factor(df_richness$Block)/df_richness$Grazer),
        data = df_richness)

sp_total <- aov(df_richness$Richness_T ~df_richness$Mesohabitat*df_richness$Grazer*df_richness$Substrate + 
        Error(as.factor(df_richness$Block)/df_richness$Grazer),
        data = df_richness)
summary(sp_total)
