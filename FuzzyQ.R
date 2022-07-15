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

AOplot(FQAnts)
