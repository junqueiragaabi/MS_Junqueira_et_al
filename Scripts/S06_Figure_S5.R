fig_S5_plot_a <- ggplot(df_axis_pcoa_rare,aes(x = pcoa_1_bray, y = pcoa_2_bray,
        fill = Mesohabitat)) +
    geom_point(shape = 21, size = 3.7, alpha = 1) + 
    theme_bw() +
    xlab("PCoA1") +
    ylab("PCoA2") +
    annotate("text", x = -0.48, y = 0.47, label = "(a)", family = "Open Sans",
            fontface = "bold", size = 4) +
    annotate("text", x = 0.33, y = 0.33, label = "Pool", family = "Open Sans",
            fontface = "bold", size = 5, color = "#eab975") +
    annotate("text", x = - 0.33, y = -0.34, label = "Riffle", family = "Open Sans",
            fontface = "bold", size = 5, color = "#3f7d9f") +
    scale_x_continuous(breaks = c(-0.50, -0.25, 0.00, 0.25, 0.50)) +
    scale_y_continuous(breaks = c(-0.50, -0.25, 0.00, 0.25, 0.50)) +
    scale_fill_manual(values = c("#eab975","#3f7d9f"), guide = "none") +
    theme(axis.title = element_text(color = "black", size = 12, family = "Open Sans"),
          axis.text.x = element_text(size = 10, family = "Open Sans"),
          axis.text.y = element_text(size = 10, family = "Open Sans", angle = 90, hjust = .50)) +
    coord_cartesian(xlim = c(-0.50, 0.50), ylim = c(-0.50, 0.50))

fig_S5_plot_b <- ggplot() +
    geom_point(data = df_pool_rare, aes(x = pcoa_1_bray, y = pcoa_2_bray), size = 3.7,
        shape = 21, fill = "#ececec") + 
    geom_point(data = df_riffle_rare,aes(x = pcoa_1_bray, y = pcoa_2_bray,
        fill = Grazer), size = 3.7, shape = 21) +
    ggforce::geom_shape(data = df_hull_riffle_grazer_br, aes(x = pcoa_1_bray, y = pcoa_2_bray,
    fill = Grazer, color = Grazer), radius = 0.03, expand = 0.028, alpha = 0.2) +
    scale_fill_manual(values = c("#b44739", "#4c9095"), guide = "none") +
    scale_color_manual(values = c("#b44739", "#4c9095"), guide = "none") +
    scale_x_continuous(breaks = c(-0.50, -0.25, 0.00, 0.25, 0.50)) +
    scale_y_continuous(breaks = c(-0.50, -0.25, 0.00, 0.25, 0.50)) +
    annotate("text", x = -0.48, y = 0.47, label = "(b)", family = "Open Sans",
            fontface = "bold", size = 4) +
    annotate("text", x = 0.44, y = 0.47, label = "Riffle", family = "Open Sans",
             size = 4, color = "black") +
    theme_bw() +
    xlab("") +
    ylab("PCoA2") +
    theme(axis.title = element_text(color = "black", size = 12, family = "Open Sans"),
          axis.text.x = element_text(size = 10, family = "Open Sans"),
          axis.text.y = element_text(size = 10, family = "Open Sans", angle = 90, hjust = .50))+
    coord_cartesian(xlim = c(-0.50, 0.50), ylim = c(-0.50, 0.50))

fig_S5_plot_c <- ggplot() +
    geom_point(data = df_riffle_rare, aes(x = pcoa_1_bray, y = pcoa_2_bray), size = 3.7,
        shape = 21, fill = "#ececec") + 
    geom_point(data = df_pool_rare,aes(x = pcoa_1_bray, y = pcoa_2_bray,
        fill = Grazer), size = 3.7, shape = 21) +
    ggforce::geom_shape(data = df_hull_pool_grazer_br, aes(x = pcoa_1_bray, y = pcoa_2_bray,
    fill = Grazer, color = Grazer), radius = 0.03, expand = 0.028, alpha = 0.2) +
    scale_fill_manual(values = c("#b44739", "#4c9095")) +
    scale_color_manual(values = c("#b44739", "#4c9095")) +
    scale_x_continuous(breaks = c(-0.50, -0.25, 0.00, 0.25, 0.50)) +
    scale_y_continuous(breaks = c(-0.50, -0.25, 0.00, 0.25, 0.50)) +
    annotate("text", x = -0.48, y = 0.47, label = "(c)", family = "Open Sans",
            fontface = "bold", size = 4) +
    annotate("text", x = 0.44, y = 0.47, label = "Pool", family = "Open Sans",
             size = 4, color = "black") +
    theme_bw() +
    theme(axis.title = element_blank(),
          axis.text.x = element_text(size = 10, family = "Open Sans"),
          axis.text.y = element_text(size = 10, family = "Open Sans", angle = 90, hjust = .50),
          legend.title =  element_text(size = 11, color = "black", family = "Open Sans"),
          legend.text = element_text(size = 10, family = "Open Sans"))+
    coord_cartesian(xlim = c(-0.50, 0.50), ylim = c(-0.50, 0.50))

fig_S5_plot_d <- ggplot() +
    geom_point(data = df_pool_rare, aes(x = pcoa_1_bray, y = pcoa_2_bray), size = 3.7,
        shape = 21, fill = "#ececec") + 
    geom_point(data = df_riffle_rare,aes(x = pcoa_1_bray, y = pcoa_2_bray,
        fill = Substrate), size = 3.7, shape = 21) +
    ggforce::geom_shape(data = df_hull_riffle_substrate_br, aes(x = pcoa_1_bray, y = pcoa_2_bray,
    fill = Substrate, color = Substrate), radius = 0.03, expand = 0.028, alpha = 0.2) +
    scale_fill_manual(values = c("#1e8516", "#E9A264"), guide = "none") +
    scale_color_manual(values = c("#1e8516", "#E9A264"), guide = "none") +
    scale_x_continuous(breaks = c(-0.50, -0.25, 0.00, 0.25, 0.50)) +
    scale_y_continuous(breaks = c(-0.50, -0.25, 0.00, 0.25, 0.50)) +
    annotate("text", x = -0.48, y = 0.47, label = "(d)", family = "Open Sans",
            fontface = "bold", size = 4) +
    annotate("text", x = 0.44, y = 0.47, label = "Riffle", family = "Open Sans",
             size = 4, color = "black") +
    theme_bw() +
    xlab("PCoA2") +
    ylab("PCoA2") +
    theme(axis.title = element_text(color = "black", size = 12, family = "Open Sans"),
          axis.text.x = element_text(size = 10, family = "Open Sans"),
          axis.text.y = element_text(size = 10, family = "Open Sans", angle = 90, hjust = .50)) +
    coord_cartesian(xlim = c(-0.50, 0.50), ylim = c(-0.50, 0.50))


fig_S5_plot_e <- ggplot() +
    geom_point(data = df_riffle_rare, aes(x = pcoa_1_bray, y = pcoa_2_bray), size = 3.7,
        shape = 21, fill = "#ececec") + 
    geom_point(data = df_pool_rare,aes(x = pcoa_1_bray, y = pcoa_2_bray,
        fill = Substrate), size = 3.7, shape = 21) +
    ggforce::geom_shape(data = df_hull_pool_substrate_br, aes(x = pcoa_1_bray, y = pcoa_2_bray,
    fill = Substrate, color = Substrate), radius = 0.03, expand = 0.028, alpha = 0.2) +
    scale_fill_manual(values = c("#1e8516", "#E9A264")) +
    scale_color_manual(values = c("#1e8516", "#E9A264")) +
    scale_x_continuous(breaks = c(-0.50, -0.25, 0.00, 0.25, 0.50)) +
    scale_y_continuous(breaks = c(-0.50, -0.25, 0.00, 0.25, 0.50)) +
    annotate("text", x = -0.48, y = 0.47, label = "(e)", family = "Open Sans",
            fontface = "bold", size = 4) +
    annotate("text", x = 0.44, y = 0.47, label = "Pool", family = "Open Sans",
             size = 4, color = "black") +
    theme_bw() +
    xlab("PCoA2") +
    ylab("PCoA2") +
    theme(axis.title.x = element_text(color = "black", size = 12, family = "Open Sans"),
          axis.title.y = element_blank(),
          axis.text.x = element_text(size = 10, family = "Open Sans"),
          axis.text.y = element_text(size = 10, family = "Open Sans", angle = 90, hjust = .50),
          legend.title =  element_text(size = 11, color = "black", family = "Open Sans"),
          legend.text = element_text(size = 10, family = "Open Sans")) +
    coord_cartesian(xlim = c(-0.50, 0.50), ylim = c(-0.50, 0.50))


fig_S5_plot_grazer <- fig_S5_plot_b + fig_S5_plot_c

fig_S5_plot_substrate <- fig_S5_plot_d + fig_S5_plot_e

fig_S5_plot_a / fig_S5_plot_grazer / fig_S5_plot_substrate

ggsave("Figura_S5.png", width = 7.08, height = 8.75, units = "in", dpi = 1000)
