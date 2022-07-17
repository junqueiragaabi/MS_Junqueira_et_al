df_richness %>%
    select(Block:Richness_R_Fuzzy_II) %>%
    group_by(Mesohabitat, Grazer, Substrate) %>%
    summarise_at(vars(Richness_T:Richness_R_Fuzzy_II), mean, na.rm = TRUE) %>%
    ggplot(aes(x = Mesohabitat, y = Richness_T, color = Grazer)) + 
        geom_point()
