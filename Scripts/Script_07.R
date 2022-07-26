pcoa_commum_soren <- pco(diatom_commum_soren_f)
pcoa_commum_bray <- pco(diatom_commum_bray_f)

axis_pcoa_commum_soren <- as.data.frame(pcoa_commum_soren$points[,1:2])
axis_pcoa_commum_bray <- as.data.frame(pcoa_commum_bray$points[,1:2])

df_axis_pcoa_commum <- cbind(df_factors,
                    axis_pcoa_commum_soren,
                    axis_pcoa_commum_bray) %>%
            rename(pcoa_1_soren = 9,
            pcoa_2_soren = 10,
            pcoa_1_bray = 11,
            pcoa_2_bray = 12)

df_pool_commum <- df_axis_pcoa_commum %>%
    filter(Mesohabitat == "Pool")

df_riffle_commum <- df_axis_pcoa_commum %>%
    filter(Mesohabitat == "Riffle")

df_hull_riffle_grazer_sc <- df_axis_pcoa_commum %>%
    filter(Mesohabitat == "Riffle") %>%
    group_by(Grazer) %>%
    slice(c(chull(pcoa_1_soren,pcoa_2_soren),
            chull(pcoa_1_soren,pcoa_2_soren)[1]))

df_hull_pool_grazer_sc <- df_axis_pcoa_commum %>%
    filter(Mesohabitat == "Pool") %>%
    group_by(Grazer) %>%
    slice(c(chull(pcoa_1_soren,pcoa_2_soren),
            chull(pcoa_1_soren,pcoa_2_soren)[1]))

df_hull_riffle_grazer_bc <- df_axis_pcoa_commum %>%
    filter(Mesohabitat == "Riffle") %>%
    group_by(Grazer) %>%
    slice(c(chull(pcoa_1_bray,pcoa_2_bray),
            chull(pcoa_1_bray,pcoa_2_bray)[1]))

df_hull_pool_grazer_bc <- df_axis_pcoa_commum %>%
    filter(Mesohabitat == "Pool") %>%
    group_by(Grazer) %>%
    slice(c(chull(pcoa_1_bray,pcoa_2_bray),
            chull(pcoa_1_bray,pcoa_2_bray)[1]))

df_hull_riffle_substrate_sc <- df_axis_pcoa_commum %>%
    filter(Mesohabitat == "Riffle") %>%
    group_by(Substrate) %>%
    slice(c(chull(pcoa_1_soren,pcoa_2_soren),
            chull(pcoa_1_soren,pcoa_2_soren)[1]))

df_hull_pool_substrate_sc <- df_axis_pcoa_commum %>%
    filter(Mesohabitat == "Pool") %>%
    group_by(Substrate) %>%
    slice(c(chull(pcoa_1_soren,pcoa_2_soren),
            chull(pcoa_1_soren,pcoa_2_soren)[1]))

df_hull_riffle_substrate_bc <- df_axis_pcoa_commum %>%
    filter(Mesohabitat == "Riffle") %>%
    group_by(Substrate) %>%
    slice(c(chull(pcoa_1_bray,pcoa_2_bray),
            chull(pcoa_1_bray,pcoa_2_bray)[1]))

df_hull_pool_substrate_bc <- df_axis_pcoa_commum %>%
    filter(Mesohabitat == "Pool") %>%
    group_by(Substrate) %>%
    slice(c(chull(pcoa_1_bray,pcoa_2_bray),
            chull(pcoa_1_bray,pcoa_2_bray)[1]))