model_1 <- aov(df_richness$Richness_T ~df_richness$Mesohabitat*df_richness$Grazer*df_richness$Substrate + 
        Error(as.factor(df_richness$Block)/df_richness$Grazer),
        data = df_richness)

summary(model_1)


model_2 <- aov(df_richness$Richness_T ~ df_richness$Block + df_richness$Mesohabitat*df_richness$Grazer*df_richness$Substrate + 
        Error(as.factor(df_richness$Block)/df_richness$Mesohabitat/df_richness$Grazer),
        data = df_richness)

summary(model_2)

f <- system.file("external/ssp.csv", package="agricolae")
ssp<-read.csv(f)

class(ssp)
class(df_richness)

model <- with(df_richness,agricolae::ssp.plot(factor(Block),factor(Mesohabitat),factor(Grazer),factor(Substrate),Richness_T))

model_split <-with(ssp,ssp.plot(block,nitrogen,management,variety,yield))

gla<-model$gl.a; glb<-model$gl.b; glc<-model$gl.c
Ea<-model$Ea; Eb<-model$Eb; Ec<-model$Ec
op<-par(mfrow=c(1,3),cex=0.6)
out1<-with(ssp,LSD.test(yield,nitrogen,gla,Ea,console=TRUE, p.adj = "bonferroni", alpha = 0.05, group = TRUE))
out2<-with(ssp,LSD.test(yield,management,glb,Eb,console=TRUE, p.adj = "bonferroni", alpha = 0.05, group = TRUE))
out3<-with(ssp,LSD.test(yield,variety,glc,Ec,console=TRUE, p.adj = "bonferroni", alpha = 0.05, group = TRUE))

summary(model_split)
