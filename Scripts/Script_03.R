G_S <- c("AR","AS","PR","PS","AR","AS","PR","PS")

df_plot <- df_richness %>%
    select(Block:Richness_R_Fuzzy_II) %>%
    group_by(Mesohabitat, Grazer, Substrate) %>%
    summarise_at(vars(Richness_T:Richness_R_Fuzzy_II), mean, na.rm = TRUE) %>%
    ungroup()

ggplot(df_plot,aes(x = Mesohabitat, y = Richness_T, color = Grazer,
    group = G_S, linetype = Substrate)) +
    geom_point(size = 3) +
    geom_line(size = 1) +
    theme_test()+
    scale_y_continuous(limits = c(10,30))+
    scale_x_discrete(limits = c("Riffle", "Pool")) +
    theme(axis.text = element_text(family ="Arial", size = 16))


View(df_richness)
