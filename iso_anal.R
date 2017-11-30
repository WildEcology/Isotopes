library(ggplot2)
library(lme4)
library(tidyr)
library(reshape2)
library(lattice)

iso=read.csv("data_nov29.csv")
head(iso)

##simple linear models
summary(lm(avnum~wpbr+year, data=iso))
summary(lm(avlen~wpbr+year, data=iso))


iso2=iso
iso2$wpbr_num=ifelse(iso2$wpbr=="yes", 1, 0)
summary(glmer(wpbr_num~avlen+(1|year), data=iso2, family=binomial))


##plot
ggplot(iso, aes(year, avnum, color=wpbr))+
  geom_smooth()+
  scale_x_reverse()+
  labs(title="Average number of needles across years", x="Year", y="Ave Number")+
  theme_classic()

xyplot(avlen~year, data=iso, na.rm=TRUE, type=c("p", "r"))

ggplot(iso, aes(year, avlen, color=wpbr))+
  geom_boxplot(position = "dodge")+
  scale_x_reverse()+
  labs(title="Average needle length across years", x="Year", y="Ave Needle Length (mm)")+
  theme_classic()

boxplot(avlen~wpbr, data=iso) 

##nodes
ggplot(iso, aes(year, avnode, color=wpbr))+
  geom_smooth()+
  scale_x_reverse()+
  labs(title="Average length across years", x="Year", y="Ave Length")+
  theme_classic()


ggplot(iso, aes(year, avnode, color=wpbr))+
  geom_boxplot()


summary(lm(avnode~wpbr+year, data=iso))

