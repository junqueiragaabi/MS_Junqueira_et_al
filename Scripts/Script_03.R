font_add_google("Noto Sans")


G_S <- c("AR","AS","PR","PS","AR","AS","PR","PS")

df_plot <- df_richness %>%
    select(Block:Richness_R_Fuzzy_II) %>%
    group_by(Mesohabitat, Grazer, Substrate) %>%
    summarise_at(vars(Richness_T:Richness_R_Fuzzy_II), mean, na.rm = TRUE) %>%
    ungroup()

ggplot(df_plot,aes(x = Mesohabitat, y = Richness_T, color = Grazer,
    group = G_S, linetype = Substrate)) +
    ylab("Number of species\n") +
    geom_point(size = 4, shape = 19) +
    geom_line(size = 1.2) +
    theme_test() +
    annotate("text", x = 0.5, y = 30, label = "(a)", fontface = "bold",
    size = 5) +
    scale_color_manual(values = c())
    scale_y_continuous(limits = c(10, 30)) +
    scale_x_discrete(limits = c("Riffle", "Pool")) +
    theme(axis.text = element_text(size = 16),
          axis.title = element_text(size = 16, color = "black"),
          axis.ticks.x = element_blank(),
          legend.title =  element_text(size = 12, color = "black"),
          legend.text = element_text(size = 10)
          )
View(df_richness)
