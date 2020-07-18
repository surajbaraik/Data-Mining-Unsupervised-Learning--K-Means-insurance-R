install.packages("plyr")
library(plyr)
insurance<-read.csv(file.choose())
attach(insurance)
View(insurance)
plot(insurance)
plot(Premiums.Paid,Days.to.Renew)
text(insurance, rownames(insurance))

km <- kmeans(insurance,4) 
str(km)

install.packages("animation")
library(animation)

km <- kmeans.ani(insurane, 4)
km$centers

max_centers=12

install.packages("kselection")
library(kselection)

k <- kselection(insurance[,-5], parallel = TRUE, k_threshold = 0.9, )
k

install.packages("doParallel")
library(doParallel)
registerDoParallel(cores=4)
k <- kselection(insurance[,-5], parallel = TRUE, k_threshold = 0.9, max_centers=12)
k

z <- scale(insurance[,2:5])
z
fit <- kmeans(z, 4)
str(fit)
final2<- data.frame(insurance, fit$cluster) 
final2
final3 <- final2[,c(ncol(final2),1:(ncol(final2)-1))]
final3
aggregate(insurance[,2:5], by=list(fit$cluster), FUN=mean)
wss
for (i in 1:8) wss[i] = sum(kmeans(z, centers=i)$withinss)
plot(1:8, wss, type="b", xlab="Number of Clusters", ylab="Within groups sum of squares")
title(sub = "K-Means Clustering Scree-Plot")

install.packages("cluster")
library(cluster)
xds <- rbind(cbind(rnorm(5000, 0, 8), rnorm(5000, 0, 8)), cbind(rnorm(5000, 50, 8), rnorm(5000, 50, 8)))
xds
xcl <- clara(xds, 2, sample = 100)
clusplot(xcl)

xpm <- pam(xds, 2)
xpm
clusplot(xpm)


