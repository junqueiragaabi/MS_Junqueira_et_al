## Script for FuzzyQ of diatoms
## Fuzzy Quantification of common and rare species
## in ecological communities (FuzzyQ)


##Preparing data set--------------------

df_diatom_f <- df_diatom %>%
    dplyr::select(ACS1:last_col())

##FuzzyQ index- Balbuena et al., 2021---

#Fuzzy clustering
FQdiatom <- FuzzyQ::fuzzyq(df_diatom_f, sorting = TRUE)


Fq_diatom <- as.data.frame(FQdiatom$A_O)

View(Fq_diatom)

#Applies FuzzyQ to N bootstrap replicates
#by site of the species abundance matrix
#N = 40 = experimental unit
BS.FQdiatom <- FuzzyQ::fuzzyqBoot(df_diatom_f, N = 4e2,
            level = "spp")

#For confidence intervals (95% by default)
# method = bca - bias corrected and accelerated
BS.FQdiatom <- FuzzyQ::fuzzyqCI(BS.FQdiatom, fq = FQdiatom,
             method = "bca")

BS.FQdiatom <- FuzzyQ::sortClus(BS.FQdiatom, FQdiatom)

col.RC <- c("brown2", "turquoise3")

#for save the plot_1 --------------------
png(here::here("Output", "Figure_S1.png"),
    width = 7.08, height = 7.08,
    units = "in", res = 1200)

#Plot_1----------------------------------

ggplotify::as.ggplot(~FuzzyQ::AOplot(FQdiatom, col.RC, pch = 16)) +
    annotate("text", x = 0, y = 250, label = "(a)", fontface = "bold", size = 7,family = "Lato")

dev.off() #the end of plot 1


spp <- FQdiatom$spp

#Plot_2----------------------------------
plot_a <- ggplotify::as.ggplot(~barplot(spp[,2],col = col.RC[spp[, 1] + 1],
        las = 2, cex.names = 0.6,
        xlab = "Species", ylab = "Silhouette width",
        cex.axis = 0.8)) +
    annotate("text", x = 0.090, y = 0.90, label = "(a)", fontface = "bold", size = 4)

#for save the plot_3 --------------------
png(here::here("Output", "Figure_S2.png"),
    width = 7.08, height = 7.08,
    units = "in", res = 1200)

#Plot_3----------------------------------
plot(spp[, 3], cex.axis = 0.8, xaxt = "n", ylab = "Commoness index",
     ylim = c(0, max(BS.FQdiatom)), xlab = "Species",
     col = col.RC[spp[, 1] + 1], # nolint
     pch = 16, cex = 0.8, las = 1)
ebar_int <- seq_len(nrow(spp)) # use arrows function to draw CIs:
arrows(ebar_int, BS.FQdiatom["Lower", ], ebar_int, BS.FQdiatom["Upper", ],
       length = 0, col = col.RC[spp[, 1] + 1])
abline(h = 0.5, col = "orange3", xpd = FALSE)
axis(1, at = ebar_int, las = 2, cex.axis = 0.6)

dev.off() #the end of plot 3

##The end of the script##