
G_S <- c("AR","AS","PR","PS","AR","AS","PR","PS")

df_plot <- df_richness %>%
    select(Block:Richness_R_Fuzzy_II) %>%
    group_by(Mesohabitat, Grazer, Substrate) %>%
    summarise_at(vars(Richness_T:Richness_R_Fuzzy_II), funs(mean, sd), na.rm = TRUE) %>%
    ungroup()
    
View(df_plot)

plot_richness_total <- ggplot(df_plot,aes(x = Mesohabitat, y = Richness_T_mean, colour = Grazer,
    group = G_S)) +
    ylab("Number of species") +
    geom_pointrange(aes(ymin = Richness_T_mean - Richness_T_sd,
                      ymax = Richness_T_mean + Richness_T_sd),
                      position = position_dodge(0.3),
                      size = 1) +
    geom_line(aes(linetype = Substrate),
                size = 1.5,
                position = position_dodge(0.3)) +
    theme_test() +
    annotate("text", x = 0.6, y = 34, label = "(a)", fontface = "bold", size = 7, , family = "Lato") +
    scale_color_manual(values = c("#b44739", "#4c9095"))+
    scale_y_continuous(limits = c(0, 35)) +
    scale_x_discrete(limits = c("Riffle", "Pool")) +
     theme(axis.text.x = element_text(size = 20, family = "Lato"),
          axis.text.y = element_text(size = 16, family = "Lato"),
          axis.title = element_text(size = 25, color = "black", family = "Lato"),
          axis.ticks.x = element_blank(),
          legend.title =  element_text(size = 20, color = "black", family = "Lato"),
          legend.text = element_text(size = 18, family = "Lato"),
          legend.position = "bottom",
          panel.border = element_rect(color = "black", size = 1.8),
          legend.key.size = unit(3, "line"),
          legend.margin = margin(15,0,0,0)) +
    guides(colour = guide_legend(order = 1), linetype = guide_legend(order = 2))

plot_richness_common <- ggplot(df_plot,aes(x = Mesohabitat, y = Richness_C_Fuzzy_I_mean, colour = Grazer,
    group = G_S)) +
    ylab("") +
    geom_pointrange(aes(ymin = Richness_C_Fuzzy_I_mean - Richness_C_Fuzzy_I_sd,
                      ymax = Richness_C_Fuzzy_I_mean + Richness_C_Fuzzy_I_sd),
                      position = position_dodge(0.3),
                      size = 1) +
    geom_line(aes(linetype = Substrate),
                size = 1.5,
                position = position_dodge(0.3)) +
    theme_test() +
    annotate("text", x = 0.6, y = 24, label = "(b)", fontface = "bold", size = 7, , family = "Lato") +
    scale_color_manual(values = c("#b44739", "#4c9095"))+
    scale_y_continuous(limits = c(0, 25)) +
    scale_x_discrete(limits = c("Riffle", "Pool")) +
     theme(axis.text.x = element_text(size = 20, family = "Lato"),
          axis.text.y = element_text(size = 16, family = "Lato"),
          axis.title = element_text(size = 25, color = "black", family = "Lato"),
          axis.ticks.x = element_blank(),
          legend.title =  element_text(size = 20, color = "black", family = "Lato"),
          legend.text = element_text(size = 18, family = "Lato"),
          legend.position = "bottom",
          panel.border = element_rect(color = "black", size = 1.8),
          legend.key.size = unit(3, "line"),
          legend.margin = margin(15,0,0,0)) +
    guides(colour = guide_legend(order = 1), linetype = guide_legend(order = 2))

plot_richness_rare <- ggplot(df_plot,aes(x = Mesohabitat, y = Richness_R_Fuzzy_I_mean, colour = Grazer,
    group = G_S)) +
    ylab("") +
    geom_pointrange(aes(ymin = Richness_R_Fuzzy_I_mean - Richness_R_Fuzzy_I_sd,
                      ymax = Richness_R_Fuzzy_I_mean + Richness_R_Fuzzy_I_sd),
                      position = position_dodge(0.3),
                      size = 1) +
    geom_line(aes(linetype = Substrate),
                size = 1.5,
                position = position_dodge(0.3)) +
    theme_test() +
    annotate("text", x = 0.6, y = 14, label = "(c)", fontface = "bold", size = 7, , family = "Lato") +
    scale_color_manual(values = c("#b44739", "#4c9095"))+
    scale_y_continuous(limits = c(0, 15)) +
    scale_x_discrete(limits = c("Riffle", "Pool")) +
    theme(axis.text.x = element_text(size = 20, family = "Lato"),
          axis.text.y = element_text(size = 16, family = "Lato"),
          axis.title = element_text(size = 25, color = "black", family = "Lato"),
          axis.ticks.x = element_blank(),
          legend.title =  element_text(size = 20, color = "black", family = "Lato"),
          legend.text = element_text(size = 18, family = "Lato"),
          legend.position = "bottom",
          panel.border = element_rect(color = "black", size = 1.8),
          legend.key.size = unit(3, "line"),
          legend.margin = margin(15,0,0,0)) +
    guides(colour = guide_legend(order = 1), linetype = guide_legend(order = 2))

plot_richness_total + plot_richness_common + plot_richness_rare + 
    plot_layout(guides = "collect") & theme(legend.position = "bottom")

ggsave(here::here("Output","Figure_2.png"),
    height = 6, width =15,units="in",dpi=600)
