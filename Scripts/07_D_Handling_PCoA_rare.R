## Script for handling data for PCoA representation
## Rare species
## Bray-Curtis - abundance data
## Sorensen - presence and absence
## OBS: run the script 03_D_Dissimilarity_index_diatoms first

pcoa_rare_soren <- labdsv::pco(diatom_rare_soren_f)
pcoa_rare_bray <- labdsv::pco(diatom_rare_bray_f)

axis_pcoa_rare_soren <- as.data.frame(pcoa_rare_soren$points[,1:2])
axis_pcoa_rare_bray <- as.data.frame(pcoa_rare_bray$points[,1:2])

df_axis_pcoa_rare <- cbind(df_factors,
                    axis_pcoa_rare_soren,
                    axis_pcoa_rare_bray) %>%
            dplyr::rename(pcoa_1_soren = 9,
            pcoa_2_soren = 10,
            pcoa_1_bray = 11,
            pcoa_2_bray = 12)

df_pool_rare <- df_axis_pcoa_rare %>%
    dplyr::filter(Mesohabitat == "Pool")

df_riffle_rare <- df_axis_pcoa_rare %>%
    dplyr::filter(Mesohabitat == "Riffle")

df_hull_riffle_grazer_sr <- df_axis_pcoa_rare %>%
    dplyr::filter(Mesohabitat == "Riffle") %>%
    dplyr::group_by(Grazer) %>%
    dplyr::slice(c(chull(pcoa_1_soren, pcoa_2_soren),
            chull(pcoa_1_soren, pcoa_2_soren)[1]))

df_hull_pool_grazer_sr <- df_axis_pcoa_rare %>%
    dplyr::filter(Mesohabitat == "Pool") %>%
    dplyr::group_by(Grazer) %>%
    dplyr::slice(c(chull(pcoa_1_soren, pcoa_2_soren),
            chull(pcoa_1_soren, pcoa_2_soren)[1]))

df_hull_riffle_grazer_br <- df_axis_pcoa_rare %>%
    dplyr::filter(Mesohabitat == "Riffle") %>%
    dplyr::group_by(Grazer) %>%
    dplyr::slice(c(chull(pcoa_1_bray, pcoa_2_bray),
            chull(pcoa_1_bray, pcoa_2_bray)[1]))

df_hull_pool_grazer_br <- df_axis_pcoa_rare %>%
    dplyr::filter(Mesohabitat == "Pool") %>%
    dplyr::group_by(Grazer) %>%
    dplyr::slice(c(chull(pcoa_1_bray, pcoa_2_bray),
            chull(pcoa_1_bray, pcoa_2_bray)[1]))

## Substrate level

df_hull_riffle_substrate_d <- df_axis_pcoa_rare %>%
    dplyr::filter(Mesohabitat == "Riffle") %>%
    dplyr::filter(Grazer == "Absence") %>%
    dplyr::group_by(Substrate) %>%
    dplyr::slice(c(chull(pcoa_1_bray, pcoa_2_bray),
            chull(pcoa_1_bray, pcoa_2_bray)[1]))

df_gray_riffle_substrate_d <- df_axis_pcoa_rare %>%
    dplyr::filter(Mesohabitat == "Riffle") %>%
    dplyr::filter(Grazer == "Presence")

df_hull_riffle_substrate_f <- df_axis_pcoa_rare %>%
    dplyr::filter(Mesohabitat == "Riffle") %>%
    dplyr::filter(Grazer == "Presence") %>%
    dplyr::group_by(Substrate) %>%
    dplyr::slice(c(chull(pcoa_1_bray, pcoa_2_bray),
            chull(pcoa_1_bray, pcoa_2_bray)[1]))

df_gray_riffle_substrate_f <- df_axis_pcoa_rare %>%
    dplyr::filter(Mesohabitat == "Riffle") %>%
    dplyr::filter(Grazer == "Absence")

df_hull_pool_substrate_e <- df_axis_pcoa_rare %>%
    dplyr::filter(Mesohabitat == "Pool") %>%
    dplyr::filter(Grazer == "Absence") %>%
    dplyr::group_by(Substrate) %>%
    dplyr::slice(c(chull(pcoa_1_bray, pcoa_2_bray),
            chull(pcoa_1_bray, pcoa_2_bray)[1]))

df_gray_pool_substrate_e <- df_axis_pcoa_rare %>%
    dplyr::filter(Mesohabitat == "Pool") %>%
    dplyr::filter(Grazer == "Presence")

df_hull_pool_substrate_g <- df_axis_pcoa_rare %>%
    dplyr::filter(Mesohabitat == "Pool") %>%
    dplyr::filter(Grazer == "Presence") %>%
    dplyr::group_by(Substrate) %>%
    dplyr::slice(c(chull(pcoa_1_bray, pcoa_2_bray),
            chull(pcoa_1_bray, pcoa_2_bray)[1]))

df_gray_pool_substrate_g <- df_axis_pcoa_rare %>%
    dplyr::filter(Mesohabitat == "Pool") %>%
    dplyr::filter(Grazer == "Absence")

# The end of the script##