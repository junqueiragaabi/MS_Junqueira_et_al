## Script for Figure S3 - PCoA
## for Common species
## Sorensen - presence and absence

fig_S3_plot_a <- ggplot(df_axis_pcoa_common,aes(x = pcoa_1_soren, y = pcoa_2_soren,
        fill = Mesohabitat)) +
    geom_point(shape = 21, size = 3.7, alpha = 1) +
    theme_bw() +
    xlab("PCoA1") +
    ylab("PCoA2") +
    annotate("text", x = -0.38, y = 0.37, label = "(a)", family = "Open Sans",
            fontface = "bold", size = 4) +
    annotate("text", x = 0.23, y = 0.23, label = "Pool", family = "Open Sans",
            fontface = "bold", size = 5, color = "#eab975") +
    annotate("text", x = - 0.23, y = -0.24, label = "Riffle", family = "Open Sans",
            fontface = "bold", size = 5, color = "#3f7d9f") +
    scale_x_continuous(breaks = c(-0.41, -0.21, 0.00, 0.21, 0.41)) +
    scale_y_continuous(breaks = c(-0.41, -0.21, 0.00, 0.21, 0.41)) +
    scale_fill_manual(values = c("#eab975","#3f7d9f"), guide = "none") +
    theme(axis.title = element_text(color = "black", size = 12, family = "Open Sans"),
          axis.text.x = element_text(size = 10, family = "Open Sans"),
          axis.text.y = element_text(size = 10, family = "Open Sans", angle = 90, hjust = .50)) +
    coord_cartesian(xlim = c(-0.41, 0.41), ylim = c(-0.41, 0.41))

fig_S3_plot_b <- ggplot() +
    geom_point(data = df_pool_common, aes(x = pcoa_1_soren, y = pcoa_2_soren), size = 3.7,
        shape = 21, fill = "#ececec") +
    geom_point(data = df_riffle_common,aes(x = pcoa_1_soren, y = pcoa_2_soren,
        fill = Grazer), size = 3.7, shape = 21) +
    scale_fill_manual(values = c("#b44739", "#4c9095"), guide = "none") +
    scale_color_manual(values = c("#b44739", "#4c9095"), guide = "none") +
    scale_x_continuous(breaks = c(-0.41, -0.21, 0.00, 0.21, 0.41)) +
    scale_y_continuous(breaks = c(-0.41, -0.21, 0.00, 0.21, 0.41)) +
    annotate("text", x = -0.38, y = 0.37, label = "(b)", family = "Open Sans",
            fontface = "bold", size = 4) +
    annotate("text", x = 0.34, y = 0.37, label = "Riffle", family = "Open Sans",
             size = 4, color = "black") +
    theme_bw() +
    xlab("") +
    ylab("PCoA2") +
    theme(axis.title = element_text(color = "black", size = 12, family = "Open Sans"),
          axis.text.x = element_text(size = 10, family = "Open Sans"),
          axis.text.y = element_text(size = 10, family = "Open Sans", angle = 90, hjust = .50))+
    coord_cartesian(xlim = c(-0.41, 0.41), ylim = c(-0.41, 0.41))

fig_S3_plot_c <- ggplot() +
    geom_point(data = df_riffle_common, aes(x = pcoa_1_soren, y = pcoa_2_soren), size = 3.7,
        shape = 21, fill = "#ececec") +
    geom_point(data = df_pool_common,aes(x = pcoa_1_soren, y = pcoa_2_soren,
        fill = Grazer), size = 3.7, shape = 21) +
    scale_fill_manual(values = c("#b44739", "#4c9095")) +
    scale_color_manual(values = c("#b44739", "#4c9095")) +
    scale_x_continuous(breaks = c(-0.41, -0.21, 0.00, 0.21, 0.41)) +
    scale_y_continuous(breaks = c(-0.41, -0.21, 0.00, 0.21, 0.41)) +
    annotate("text", x = -0.38, y = 0.37, label = "(c)", family = "Open Sans",
            fontface = "bold", size = 4) +
    annotate("text", x = 0.34, y = 0.37, label = "Pool", family = "Open Sans",
             size = 4, color = "black") +
    theme_bw() +
    theme(axis.title = element_blank(),
          axis.text.x = element_text(size = 10, family = "Open Sans"),
          axis.text.y = element_text(size = 10, family = "Open Sans", angle = 90, hjust = .50),
          legend.title =  element_text(size = 11, color = "black", family = "Open Sans"),
          legend.text = element_text(size = 10, family = "Open Sans"))+
    coord_cartesian(xlim = c(-0.41, 0.41), ylim = c(-0.41, 0.41))

fig_S3_plot_d <- ggplot() +
    geom_point(data = df_pool_common, aes(x = pcoa_1_soren, y = pcoa_2_soren), size = 3.7,
        shape = 21, fill = "#ececec") +
    geom_point(data = df_riffle_common,aes(x = pcoa_1_soren, y = pcoa_2_soren,
        fill = Substrate), size = 3.7, shape = 21) +
    scale_fill_manual(name = "Substratum",
            values = c("#1e8516", "#E9A264"), guide = "none") +
    scale_color_manual(name = "Substratum",
            values = c("#1e8516", "#E9A264"), guide = "none") +
    scale_x_continuous(breaks = c(-0.41, -0.21, 0.00, 0.21, 0.41)) +
    scale_y_continuous(breaks = c(-0.41, -0.21, 0.00, 0.21, 0.41)) +
    annotate("text", x = -0.38, y = 0.37, label = "(d)", family = "Open Sans",
            fontface = "bold", size = 4) +
    annotate("text", x = 0.34, y = 0.37, label = "Riffle", family = "Open Sans",
             size = 4, color = "black") +
    theme_bw() +
    xlab("PCoA2") +
    ylab("PCoA2") +
    theme(axis.title = element_text(color = "black", size = 12, family = "Open Sans"),
          axis.text.x = element_text(size = 10, family = "Open Sans"),
          axis.text.y = element_text(size = 10, family = "Open Sans", angle = 90, hjust = .50)) +
    coord_cartesian(xlim = c(-0.41, 0.41), ylim = c(-0.41, 0.41))


fig_S3_plot_e <- ggplot() +
    geom_point(data = df_riffle_common, aes(x = pcoa_1_soren, y = pcoa_2_soren), size = 3.7,
        shape = 21, fill = "#ececec") +
    geom_point(data = df_pool_common,aes(x = pcoa_1_soren, y = pcoa_2_soren,
        fill = Substrate), size = 3.7, shape = 21) +
    scale_fill_manual(name = "Substratum",
            values = c("#1e8516", "#E9A264")) +
    scale_color_manual(name = "Substratum",
        values = c("#1e8516", "#E9A264")) +
    scale_x_continuous(breaks = c(-0.41, -0.21, 0.00, 0.21, 0.41)) +
    scale_y_continuous(breaks = c(-0.41, -0.21, 0.00, 0.21, 0.41)) +
    annotate("text", x = -0.38, y = 0.37, label = "(e)", family = "Open Sans",
            fontface = "bold", size = 4) +
    annotate("text", x = 0.34, y = 0.37, label = "Pool", family = "Open Sans",
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
    coord_cartesian(xlim = c(-0.41, 0.41), ylim = c(-0.41, 0.41))


fig_S3_plot_grazer <- fig_S3_plot_b + fig_S3_plot_c

fig_S3_plot_substrate <- fig_S3_plot_d + fig_S3_plot_e

fig_S3_plot_a / fig_S3_plot_grazer / fig_S3_plot_substrate

ggplot2::ggsave(here::here("Output","Figure_S3.png"),
    width = 7.08, height = 8.75, units = "in", dpi =1000)

## The end of the script##