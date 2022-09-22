## Script for handling data for PCoA representation
## Common species
## Bray-Curtis - abundance data
## Sorensen - presence and absence
## OBS: run the script 03_D_Dissimilarity_index_diatoms first

pcoa_common_soren <- labdsv::pco(diatom_common_soren_f)
pcoa_common_bray <- labdsv::pco(diatom_common_bray_f)

axis_pcoa_common_soren <- as.data.frame(pcoa_common_soren$points[, 1:2])
axis_pcoa_common_bray <- as.data.frame(pcoa_common_bray$points[, 1:2])

df_axis_pcoa_common <- cbind(
    df_factors,
    axis_pcoa_common_soren,
    axis_pcoa_common_bray
) %>%
    dplyr::rename(
        pcoa_1_soren = 9,
        pcoa_2_soren = 10,
        pcoa_1_bray = 11,
        pcoa_2_bray = 12
    )

df_pool_common <- df_axis_pcoa_common %>%
    dplyr::filter(Mesohabitat == "Pool")

df_riffle_common <- df_axis_pcoa_common %>%
    dplyr::filter(Mesohabitat == "Riffle")

df_hull_riffle_grazer_sc <- df_axis_pcoa_common %>%
    dplyr::filter(Mesohabitat == "Riffle") %>%
    dplyr::group_by(Grazer) %>%
    dplyr::slice(c(
        chull(pcoa_1_soren, pcoa_2_soren),
        chull(pcoa_1_soren, pcoa_2_soren)[1]
    ))

df_hull_pool_grazer_sc <- df_axis_pcoa_common %>%
    dplyr::filter(Mesohabitat == "Pool") %>%
    dplyr::group_by(Grazer) %>%
    dplyr::slice(c(
        chull(pcoa_1_soren, pcoa_2_soren),
        chull(pcoa_1_soren, pcoa_2_soren)[1]
    ))

df_hull_riffle_grazer_bc <- df_axis_pcoa_common %>%
    dplyr::filter(Mesohabitat == "Riffle") %>%
    dplyr::group_by(Grazer) %>%
    dplyr::slice(c(
        chull(pcoa_1_bray, pcoa_2_bray),
        chull(pcoa_1_bray, pcoa_2_bray)[1]
    ))

df_hull_pool_grazer_bc <- df_axis_pcoa_common %>%
    dplyr::filter(Mesohabitat == "Pool") %>%
    dplyr::group_by(Grazer) %>%
    dplyr::slice(c(
        chull(pcoa_1_bray, pcoa_2_bray),
        chull(pcoa_1_bray, pcoa_2_bray)[1]
    ))

df_hull_riffle_substrate_sc <- df_axis_pcoa_common %>%
    dplyr::filter(Mesohabitat == "Riffle") %>%
    dplyr::group_by(Substrate) %>%
    dplyr::slice(c(
        chull(pcoa_1_soren, pcoa_2_soren),
        chull(pcoa_1_soren, pcoa_2_soren)[1]
    ))

df_hull_pool_substrate_sc <- df_axis_pcoa_common %>%
    dplyr::filter(Mesohabitat == "Pool") %>%
    dplyr::group_by(Substrate) %>%
    dplyr::slice(c(
        chull(pcoa_1_soren, pcoa_2_soren),
        chull(pcoa_1_soren, pcoa_2_soren)[1]
    ))

df_hull_riffle_substrate_bc <- df_axis_pcoa_common %>%
    dplyr::filter(Mesohabitat == "Riffle") %>%
    dplyr::group_by(Substrate) %>%
    dplyr::slice(c(
        chull(pcoa_1_bray, pcoa_2_bray),
        chull(pcoa_1_bray, pcoa_2_bray)[1]
    ))

df_hull_pool_substrate_bc <- df_axis_pcoa_common %>%
    dplyr::filter(Mesohabitat == "Pool") %>%
    dplyr::group_by(Substrate) %>%
    dplyr::slice(c(
        chull(pcoa_1_bray, pcoa_2_bray),
        chull(pcoa_1_bray, pcoa_2_bray)[1]
    ))

## The end of the script##
