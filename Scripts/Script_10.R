pcoa_total_soren <- pco(diatom_total_soren)
pcoa_total_bray <- pco(diatom_total_bray)

axis_pcoa_total_soren <- as.data.frame(pcoa_total_soren$points[,1:2])
axis_pcoa_total_bray <- as.data.frame(pcoa_total_bray$points[,1:2])

df_axis_pcoa_total <- cbind(df_factors,
                    axis_pcoa_total_soren,
                    axis_pcoa_total_bray) %>%
            rename(pcoa_1_soren = 9,
            pcoa_2_soren = 10,
            pcoa_1_bray = 11,
            pcoa_2_bray = 12)
df_pool_total <- df_axis_pcoa_total %>%
    filter(Mesohabitat == "Pool")

df_riffle_total <- df_axis_pcoa_total %>%
    filter(Mesohabitat == "Riffle")

df_hull_riffle_grazer_st <- df_axis_pcoa_total %>%
    filter(Mesohabitat == "Riffle") %>%
    group_by(Grazer) %>%
    slice(c(chull(pcoa_1_soren,pcoa_2_soren),
            chull(pcoa_1_soren,pcoa_2_soren)[1]))

df_hull_pool_grazer_st <- df_axis_pcoa_total %>%
    filter(Mesohabitat == "Pool") %>%
    group_by(Grazer) %>%
    slice(c(chull(pcoa_1_soren,pcoa_2_soren),
            chull(pcoa_1_soren,pcoa_2_soren)[1]))

df_hull_riffle_grazer_bt <- df_axis_pcoa_total %>%
    filter(Mesohabitat == "Riffle") %>%
    group_by(Grazer) %>%
    slice(c(chull(pcoa_1_bray,pcoa_2_bray),
            chull(pcoa_1_bray,pcoa_2_bray)[1]))

df_hull_pool_grazer_bt <- df_axis_pcoa_total %>%
    filter(Mesohabitat == "Pool") %>%
    group_by(Grazer) %>%
    slice(c(chull(pcoa_1_bray,pcoa_2_bray),
            chull(pcoa_1_bray,pcoa_2_bray)[1]))

df_hull_riffle_substrate_st <- df_axis_pcoa_total %>%
    filter(Mesohabitat == "Riffle") %>%
    group_by(Substrate) %>%
    slice(c(chull(pcoa_1_soren,pcoa_2_soren),
            chull(pcoa_1_soren,pcoa_2_soren)[1]))

df_hull_pool_substrate_st <- df_axis_pcoa_total %>%
    filter(Mesohabitat == "Pool") %>%
    group_by(Substrate) %>%
    slice(c(chull(pcoa_1_soren,pcoa_2_soren),
            chull(pcoa_1_soren,pcoa_2_soren)[1]))

df_hull_riffle_substrate_bt <- df_axis_pcoa_total %>%
    filter(Mesohabitat == "Riffle") %>%
    group_by(Substrate) %>%
    slice(c(chull(pcoa_1_bray,pcoa_2_bray),
            chull(pcoa_1_bray,pcoa_2_bray)[1]))

df_hull_pool_substrate_bt <- df_axis_pcoa_total %>%
    filter(Mesohabitat == "Pool") %>%
    group_by(Substrate) %>%
    slice(c(chull(pcoa_1_bray,pcoa_2_bray),
            chull(pcoa_1_bray,pcoa_2_bray)[1]))