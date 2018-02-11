

library(ggplot2)
library(vegan)
library(dplyr)

##set working directory
setwd("~/Documents/Research/WPBRDRT/IsotopeData/Analysisfiles/")

##importing when biome file
Isotopes = read.csv("2018_IsotopeData.csv", header = T)

attach(Isotopes)

##change pairs to factors
Isotopes$Pair<-as.factor(Isotopes$Pair)

##CIsotopes
Cdata<-ggplot()+
  geom_line(data=Isotopes,
             aes(x=Year, y=d13Cpermil, 
                 group=TreeName, 
                 color=Treatment))+
  facet_grid(Isotopes$Pair~.)+
  scale_x_reverse()+
  ggtitle("d13C Data for Paired Blister Rust Sampling")+
  xlab("Year")+
  ylab('d13C per mil')
  


##NitrogenPercent
Ndata<-ggplot()+
  geom_line(data=Isotopes,
            aes(x=Year, y=PerN, 
                group=TreeName, 
                color=Treatment))+
  facet_grid(Isotopes$Pair~.)+
  scale_x_reverse()+
  ggtitle("PerN Data for Paired Blister Rust Sampling")+
  xlab("Year")+
  ylab('%N')
