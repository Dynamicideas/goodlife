
#we import our data first by reading it in with our read command. using the exact data type extension  
#if we encounter any error we can easily use the  rlang::error() command 


sealwork<-read.csv("/home/goodlife/Downloads/Seal averages 2007-2010.csv")
dim(sealwork) #To check the dimension of the file. the row and the column 
View(sealwork) #To view the csv file in r studio

str(sealwork)#using this function, gives us the summary of the data in the csv file.

plot(sealwork)

#using the aes function is to select the what we want to have as our x and y axis
ggplot(sealwork, aes(x=Summer, y=average.count)) 
#adding the geom_bar function is to specify the type of chart we want , which is the barchart
#we add stat to it to give us the size(thickness) of the bars 
ggplot(sealwork, aes(x=Summer, y=average.count)) + geom_bar(stat ="identity", width = 0.9) + theme_bw()

#when you add the attribute "fill" to the aes function. it brings about more meaning to the chart

ggplot(sealwork, aes(fill = Species, x = Summer, y=average.count)) + geom_bar(stat ="identity", width = 0.9) + theme_bw()

#we add the attribute "position" to the geom_bar function. to give spacing inbetween the bars

ggplot(sealwork, aes(fill = Species, x = Summer, y=average.count)) + geom_bar(position ="dodge", stat ="identity", width = 0.9) + theme_bw()

#to use grid observation we add the function called facet_grid
ggplot(sealwork, aes(fill = Species, x = Summer, y=average.count)) + geom_bar(position ="dodge", stat ="identity", width = 0.9) + facet_grid(Species ~ Summer, scales = "free") + theme_bw()

#we use the facet function on site too, given us a different result on different site that has been worked on over the years.
ggplot(sealwork, aes(fill = Species, x = Summer, y=average.count)) + geom_bar(position ="dodge", stat ="identity", width = 0.9) + facet_grid(Species ~ Site, scales = "free") + theme_bw()

#incase there is no need for separating into different grids. we just use a full stop in place of another variable

ggplot(sealwork, aes(fill = Species, x = Summer, y=average.count)) + geom_bar(position ="dodge", stat ="identity", width = 0.9) + facet_grid(Species ~ ., scales = "free") + theme_bw()

###### further changes can be made.....

ggplot(sealwork, aes(fill = Species, x =Year.Month, y=average.count)) + geom_bar(position ="dodge", stat ="identity", width = 0.9) + facet_grid(Species ~ ., scales = "free") + theme_bw()

#to correct the date being out of order. we re arrange it by doing this below

Month<- factor(sealwork$Year.Month,levels = c("2007.Jun", "2007.Jul", "2007.Aug",
                                            "2008.Jun", "2008.Jul", "2008.Aug",
                                          "2008.Sep", "2009.Jun", "2009.Jul",
                                           "2009.Aug", "2009.Sep", "2010.Jun",      
                                          "2010.Jul", "2010.Aug", "2010.Sep"))

#now use the month factor

ggplot(sealwork, aes(fill = Species, x=Month, y=average.count)) + geom_bar(position ="dodge", stat ="identity", width = 0.9) + facet_grid(Species ~ ., scales = "free") + theme_bw()

#.......

ggplot(sealwork, aes(fill = Species, x=Month, y=average.count)) +
           geom_bar(position = "dodge", stat = "identity", width = 0.9) +
           scale_fill_manual(values = c("yellow","pink")) + 
           theme(panel.background = element_blank(), axis.text = element_text(angle = 90))


