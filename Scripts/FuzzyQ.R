library(FuzzyQ)

data(antsA)
View(antsA)


FQAnts <- fuzzyq(antsA, sorting = TRUE)

#dados de frequencia relativa de sítios ocupados
# e abundância média por sítio
FQAnts$A_O

#contém os resultados de agrupamentos
#difuso por espécie
FQAnts$spp

BS.FQAnts <- fuzzyqBoot(antsA, N= 1e3, level='spp')

BS.FQAnts <- fuzzyqCI (BS.FQAnts, fq = FQAnts, method="bca")

col.RC <- c("brown2", "turquoise3")
AOplot(FQAnts, col.RC, pch = 16)

BS.FQAnts <- sortClus(BS.FQAnts, FQAnts)

spp <- FQAnts$spp

barplot(spp[,2], names.arg=rownames(spp), 
        col=col.RC[spp[,1]+1],
        las=2, cex.names=0.6, xlab="Species", ylab="Silhouette width", 
        cex.axis = 0.8)
legend(0, -0.1, c("Rare", "Common"), col = col.RC, pch = 15, cex = 0.8)

plot(spp[,3], cex.axis=0.8, xaxt='n', ylab="Commoness index",
     ylim=c(0, max(BS.FQAnts)), xlab="Species",col=col.RC[spp[,1]+1],
     pch=16, cex=0.8, las = 1)
ebar.int <- seq_len(nrow(spp)) # use arrows function to draw CIs:
arrows(ebar.int, BS.FQAnts["Lower", ], ebar.int, BS.FQAnts["Upper", ],
       length= 0, col=col.RC[spp[,1]+1])
abline(h=0.5, col="orange3",xpd=FALSE)
axis(1, at=ebar.int, labels=rownames(spp), las=2, cex.axis=0.6)
