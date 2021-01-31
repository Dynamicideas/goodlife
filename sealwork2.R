
sealwork<-read.csv("/home/goodlife/Downloads/Seal averages 2007-2010.csv")
dim(sealwork) #To check the dimension of the file. the row and the column 
View(sealwork) #To view the csv file in r studio

#To test for normality . we can use the qqnorm function  and the shapiro test

qqnorm(sealwork$average.count)

#to use the shapiro test
shapiro.test(sealwork$average.count)


#To see the significant changes, we will use kruskal-wallis test and pairwise wilcox test.

kruskal.test(sealwork$average.count, sealwork$Summer)

#to have more details other than the overall anwer kruskal give to us. 

pairwise.wilcox.test(sealwork$average.count, sealwork$Summer)

#lets use the bar graph
boxplot(sealwork$average.count)

#To explore the difference between months in 2007 

kruskal.test(sealwork$average.count[sealwork$Summer=="summer-2007"],
                                    sealwork$Year.Month[sealwork$Summer=="summer-2007"])

#using pairwise test

pairwise.wilcox.test(sealwork$average.count[sealwork$Summer=="summer-2007"],
                      sealwork$Year.Month[sealwork$Summer=="summer-2007"],
                                      p.adjust.method = "BH")

#Doing species comparison

kruskal.test(sealwork$average.count, sealwork$Species)

#ploting the data 
boxplot(sealwork$average.count ~ sealwork$Species)

#........


kruskal.test(sealwork$average.count[sealwork$Summer=="summer-2008"],
             sealwork$Year.Month[sealwork$Summer=="summer-2008"])



kruskal.test(sealwork$average.count[sealwork$Summer=="summer-2009"],
             sealwork$Year.Month[sealwork$Summer=="summer-2009"])



kruskal.test(sealwork$average.count[sealwork$Summer=="summer-2010"],
             sealwork$Year.Month[sealwork$Summer=="summer-2010"])

#>..

ggplot(sealwork, aes(fill = Species, x=Month, y=average.count)) +
  geom_bar(position = "dodge", stat = "identity", width = 0.9) +
  scale_fill_manual(values = c("yellow","pink")) + 
  theme(panel.background = element_blank(), axis.text = element_text(angle = 90))

#......to develop the error bar

Month<- factor(sealwork$Year.Month,levels = c("2007.Jun", "2007.Jul", "2007.Aug",
                                              "2008.Jun", "2008.Jul", "2008.Aug",
                                             "2008.Sep", "2009.Jun", "2009.Jul",
                                              "2009.Aug", "2009.Sep", "2010.Jun",      
                                              "2010.Jul", "2010.Aug", "2010.Sep"))

#to use many further graph.. 


sealwork%>%
   tail(10) %>% 
    ggplot(aes(x=average.count, y=Species)) +
    geom_line() + geom_point()













