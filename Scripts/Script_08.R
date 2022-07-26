pcoa_rare_soren <- pco(diatom_rare_soren_f)
pcoa_rare_bray <- pco(diatom_rare_bray_f)

axis_pcoa_rare_soren <- as.data.frame(pcoa_rare_soren$points[,1:2])
axis_pcoa_rare_bray <- as.data.frame(pcoa_rare_bray$points[,1:2])

df_axis_pcoa_rare <- cbind(df_factors,
                    axis_pcoa_rare_soren,
                    axis_pcoa_rare_bray) %>%
            rename(pcoa_1_soren = 9,
            pcoa_2_soren = 10,
            pcoa_1_bray = 11,
            pcoa_2_bray = 12)

df_pool_rare <- df_axis_pcoa_rare %>%
    filter(Mesohabitat == "Pool")

df_riffle_rare <- df_axis_pcoa_rare %>%
    filter(Mesohabitat == "Riffle")

df_hull_riffle_grazer_sr <- df_axis_pcoa_rare %>%
    filter(Mesohabitat == "Riffle") %>%
    group_by(Grazer) %>%
    slice(c(chull(pcoa_1_soren,pcoa_2_soren),
            chull(pcoa_1_soren,pcoa_2_soren)[1]))

df_hull_pool_grazer_sr <- df_axis_pcoa_rare %>%
    filter(Mesohabitat == "Pool") %>%
    group_by(Grazer) %>%
    slice(c(chull(pcoa_1_soren,pcoa_2_soren),
            chull(pcoa_1_soren,pcoa_2_soren)[1]))

df_hull_riffle_grazer_br <- df_axis_pcoa_rare %>%
    filter(Mesohabitat == "Riffle") %>%
    group_by(Grazer) %>%
    slice(c(chull(pcoa_1_bray,pcoa_2_bray),
            chull(pcoa_1_bray,pcoa_2_bray)[1]))

df_hull_pool_grazer_br <- df_axis_pcoa_rare %>%
    filter(Mesohabitat == "Pool") %>%
    group_by(Grazer) %>%
    slice(c(chull(pcoa_1_bray,pcoa_2_bray),
            chull(pcoa_1_bray,pcoa_2_bray)[1]))

df_hull_riffle_substrate_sr <- df_axis_pcoa_rare %>%
    filter(Mesohabitat == "Riffle") %>%
    group_by(Substrate) %>%
    slice(c(chull(pcoa_1_soren,pcoa_2_soren),
            chull(pcoa_1_soren,pcoa_2_soren)[1]))

df_hull_pool_substrate_sr <- df_axis_pcoa_rare %>%
    filter(Mesohabitat == "Pool") %>%
    group_by(Substrate) %>%
    slice(c(chull(pcoa_1_soren,pcoa_2_soren),
            chull(pcoa_1_soren,pcoa_2_soren)[1]))

df_hull_riffle_substrate_br <- df_axis_pcoa_rare %>%
    filter(Mesohabitat == "Riffle") %>%
    group_by(Substrate) %>%
    slice(c(chull(pcoa_1_bray,pcoa_2_bray),
            chull(pcoa_1_bray,pcoa_2_bray)[1]))

df_hull_pool_substrate_br <- df_axis_pcoa_rare %>%
    filter(Mesohabitat == "Pool") %>%
    group_by(Substrate) %>%
    slice(c(chull(pcoa_1_bray,pcoa_2_bray),
            chull(pcoa_1_bray,pcoa_2_bray)[1]))