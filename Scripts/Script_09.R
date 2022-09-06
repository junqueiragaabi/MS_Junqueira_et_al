df_waffle <- df_five_common %>%
    pivot_longer(
        cols = c(ADMI:Others),
        names_to = "species",
        values_to = "abundance"
    )

df_meso_sub <- df_waffle %>%
    group_by(Mesohabitat, Substrate, species) %>%
    summarise_at(vars("abundance"), mean, ra.nm = TRUE)


plot_meso_substrate <- ggplot(df_meso_sub, aes(fill = species, values = abundance)) +
    geom_waffle(color = "white", size=0.33, n_rows = 10, 
              make_proportional = TRUE) +
  facet_wrap(Mesohabitat~Substrate) +
  scale_x_discrete(expand=c(0,0)) +
  scale_y_discrete(expand=c(0,0)) +
  coord_equal() +
  theme_enhance_waffle() +
  scale_fill_manual(name = "Species",
                    values = c("#A0CBE8","#4E79A7",
                    "#F28E2B","#E15759","#FF9D9A","#59A14F","grey70"),
                    labels = c("*Achnanthidium minutissimum*",
                    "*Cocconeis placentula*",
                    "*Eunotia incisa*",
                    "*Fragilaria capucina*",
                    "*Gomphonema parvulum*",
                    "*Navicula cryptocephala*",
                    "Others")) +
  theme_minimal() +
  theme(legend.text = element_markdown(size = 10, family = "Open Sans"))

ggsave("Figure_5.svg", dpi = 1000, width = 7.08, height = 5.75, units = "in")

df_meso_grazer <- df_waffle %>%
    group_by(Mesohabitat, Grazer, species) %>%
    summarise_at(vars("abundance"), mean, ra.nm = TRUE)


plot_meso_grazer <- ggplot(df_meso_grazer, aes(fill = species, values = abundance)) +
    geom_waffle(color = "white", size=0.33, n_rows = 10, 
              make_proportional = TRUE) +
  facet_wrap(Mesohabitat~Grazer) +
  scale_x_discrete(expand=c(0,0)) +
  scale_y_discrete(expand=c(0,0)) +
  coord_equal() +
  theme_enhance_waffle() +
  scale_fill_manual(name = "Species",
                    values = c("#A0CBE8","#4E79A7",
                    "#F28E2B","#E15759","#FF9D9A","#59A14F","grey70"),
                    labels = c("*Achnanthidium minutissimum*",
                    "*Cocconeis placentula*",
                    "*Eunotia incisa*",
                    "*Fragilaria capucina*",
                    "*Gomphonema parvulum*",
                    "*Navicula cryptocephala*",
                    "Others")) +
  theme_minimal() +
  theme(legend.text = element_markdown(size = 10, family = "Open Sans"))

ggsave("Figure_6.svg", dpi = 1000, width = 7.08, height = 5.75, units = "in")
