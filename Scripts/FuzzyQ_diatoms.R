library(FuzzyQ)
library(tidyverse)
library(BiodiversityR)

df_diatom <- read.csv(here::here("Data", "Data_diatoms_composition.csv"),
    header = TRUE, sep = ";", dec = ",")

df_diatom_f <- df_diatom %>%
    select(ACS1:last_col())

View(df_diatom_f)

FQdiatom <- fuzzyq(df_diatom_f, sorting = TRUE)


BS.FQdiatom <- fuzzyqBoot(df_diatom_f, N = 1e3, level= 'spp')
BS.FQdiatom <- fuzzyqCI(BS.FQdiatom, fq = FQdiatom, method= "bca")

BS.FQdiatom <- sortClus(BS.FQdiatom, FQdiatom)

col.RC <- c("brown2", "turquoise3")
AOplot(FQdiatom, col.RC, pch = 16)

spp <- FQdiatom$spp

barplot(spp[,2], names.arg = rownames(spp),
        col = col.RC[spp[, 1] + 1],
        las = 2, cex.names = 0.6, xlab = "Species", ylab = "Silhouette width",
        cex.axis = 0.8)
legend(0, -0.1, c("Rare", "Common"), col = col.RC, pch = 15, cex = 0.8)

plot(spp[, 3], cex.axis = 0.8, xaxt = 'n', ylab = "Commoness index",
     ylim = c(0, max(BS.FQdiatom)), xlab = "Species", col = col.RC[spp[, 1] + 1], # nolint
     pch = 16, cex = 0.8, las = 1)
ebar_int <- seq_len(nrow(spp)) # use arrows function to draw CIs:
arrows(ebar_int, BS.FQdiatom["Lower", ], ebar_int, BS.FQdiatom["Upper", ],
       length = 0, col=col.RC[spp[, 1] + 1])
abline(h = 0.5, col="orange3", xpd = FALSE)
axis(1, at = ebar_int, labels = rownames(spp), las = 2, cex.axis = 0.6)



write_csv(especies, "common_sp.csv")
