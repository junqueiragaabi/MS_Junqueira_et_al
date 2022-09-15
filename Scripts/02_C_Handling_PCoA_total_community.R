## Script for handling data for PCoA representation
## Total Community
## Bray-Curtis - abundance data
## Sorensen - presence and absence
## OBS: run the script 03_D_Dissimilarity_index_diatoms first

pcoa_total_soren <- labdsv::pco(diatom_total_soren)
pcoa_total_bray <- labdsv::pco(diatom_total_bray)

axis_pcoa_total_soren <- as.data.frame(pcoa_total_soren$points[,1:2])
axis_pcoa_total_bray <- as.data.frame(pcoa_total_bray$points[,1:2])

df_axis_pcoa_total <- cbind(df_factors,
                    axis_pcoa_total_soren,
                    axis_pcoa_total_bray) %>%
            dplyr::rename(pcoa_1_soren = 9,
            pcoa_2_soren = 10,
            pcoa_1_bray = 11,
            pcoa_2_bray = 12)
df_pool_total <- df_axis_pcoa_total %>%
    dplyr::filter(Mesohabitat == "Pool")

df_riffle_total <- df_axis_pcoa_total %>%
    dplyr::filter(Mesohabitat == "Riffle")

df_hull_riffle_grazer_st <- df_axis_pcoa_total %>%
    dplyr::filter(Mesohabitat == "Riffle") %>%
    dplyr::group_by(Grazer) %>%
    dplyr::slice(c(chull(pcoa_1_soren,pcoa_2_soren),
            chull(pcoa_1_soren,pcoa_2_soren)[1]))

df_hull_pool_grazer_st <- df_axis_pcoa_total %>%
    dplyr::filter(Mesohabitat == "Pool") %>%
    dplyr::group_by(Grazer) %>%
    dplyr::slice(c(chull(pcoa_1_soren,pcoa_2_soren),
            chull(pcoa_1_soren,pcoa_2_soren)[1]))

df_hull_riffle_grazer_bt <- df_axis_pcoa_total %>%
    dplyr::filter(Mesohabitat == "Riffle") %>%
    dplyr::group_by(Grazer) %>%
    dplyr::slice(c(chull(pcoa_1_bray,pcoa_2_bray),
            chull(pcoa_1_bray,pcoa_2_bray)[1]))

df_hull_pool_grazer_bt <- df_axis_pcoa_total %>%
    dplyr::filter(Mesohabitat == "Pool") %>%
    dplyr::group_by(Grazer) %>%
    dplyr::slice(c(chull(pcoa_1_bray,pcoa_2_bray),
            chull(pcoa_1_bray,pcoa_2_bray)[1]))

df_hull_riffle_substrate_st <- df_axis_pcoa_total %>%
    dplyr::filter(Mesohabitat == "Riffle") %>%
    dplyr::group_by(Substrate) %>%
    dplyr::slice(c(chull(pcoa_1_soren,pcoa_2_soren),
            chull(pcoa_1_soren,pcoa_2_soren)[1]))

df_hull_pool_substrate_st <- df_axis_pcoa_total %>%
    dplyr::filter(Mesohabitat == "Pool") %>%
    dplyr::group_by(Substrate) %>%
    dplyr::slice(c(chull(pcoa_1_soren,pcoa_2_soren),
            chull(pcoa_1_soren,pcoa_2_soren)[1]))

df_hull_riffle_substrate_bt <- df_axis_pcoa_total %>%
    dplyr::filter(Mesohabitat == "Riffle") %>%
    dplyr::group_by(Substrate) %>%
    dplyr::slice(c(chull(pcoa_1_bray,pcoa_2_bray),
            chull(pcoa_1_bray,pcoa_2_bray)[1]))

df_hull_pool_substrate_bt <- df_axis_pcoa_total %>%
    dplyr::filter(Mesohabitat == "Pool") %>%
    dplyr::group_by(Substrate) %>%
    dplyr::slice(c(chull(pcoa_1_bray,pcoa_2_bray),
            chull(pcoa_1_bray,pcoa_2_bray)[1]))

## The end of the script##