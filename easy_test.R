# glmmTMB Easy Test - RYN
library(glmmTMB)
library(DHARMa)

data(Salamanders)
cat("Zeros:", round(mean(Salamanders$count==0)*100,1), "%\n")

# Two models
m1 <- glmmTMB(count ~ mined + (1|site), family=poisson, data=Salamanders)
m2 <- glmmTMB(count ~ mined + (1|site), ziformula=~mined, family=poisson, data=Salamanders)


cat("AIC m1:", round(AIC(m1),1), "m2:", round(AIC(m2),1), "\n")
dir.create("results", showWarnings=FALSE)

png("results/dharmaplot.png"); plot(simulateResiduals(m2)); dev.off()

cat("Done! Check results/ folder\n")
