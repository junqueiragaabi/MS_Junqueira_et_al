## Script for transformation composite data
## and dissimilarity inde
## Bray-Curtis - abundance data
## Sorensen - presence and absence

##Preparing data set--------------------

##Community total
diatom_comp_t <- df_richness %>%
            dplyr::select(-c(Block:Richness_R_Fuzzy_II))

##common species
diatom_comp_c_fuzzy <- df_common_f %>%
              dplyr::select(-c(Block:Replication))

##Rare species
diatom_comp_r_fuzzy <- df_rare_f %>%
              dplyr::select(-c(Block:Replication))

#####Community Total-------------------------

#Hellinger transformation
diatom_total_hell <- labdsv::hellinger(diatom_comp_t)

#Bray-Curtis index
diatom_total_bray <- vegan::vegdist(diatom_total_hell, method = "bray")

#Sorensen index
diatom_total_soren <- vegan::vegdist(diatom_total_hell, method = "bray", binary = TRUE)

#####Common species---------------------------

#Hellinger transformation
diatom_common_hell_f <- labdsv::hellinger(diatom_comp_c_fuzzy)

#Bray-Curtis index
diatom_common_bray_f <- vegan::vegdist(diatom_common_hell_f, method = "bray")

#Sorensen index
diatom_common_soren_f<- vegan::vegdist(diatom_common_hell_f, method = "bray", binary = TRUE)

#####Rare species---------------------------

df_rare <- df_rare_f %>%
    dplyr::select(ACS1:last_col())

#Hellinger transformation
diatom_rare_hell_f <- labdsv::hellinger(df_rare)

#Bray-Curtis index
diatom_rare_bray_f <- vegan::vegdist(diatom_rare_hell_f, method = "bray")

#Sorensen index
diatom_rare_soren_f<- vegan::vegdist(diatom_rare_hell_f, method = "bray", binary = TRUE)


##The end of the script##