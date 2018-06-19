##Assignment 1 - DA 5020
mtcars 
library(ggplot2)
mpg

##Question 1
?mtcars
#Gear describes the number of forward gears

##Question 2
?plot
plot(mtcars$mpg, mtcars$cyl, xlab="Miles/(US) gallon", ylab="Number of Clyinders", col="blue", frame.plot=F, pch=2, cex=0.5)
#From the Scatter plot, we can infer that the data is discrete 

##Question 3
#To check the dimension of the Dataset
dim(mtcars)

#To check the class of the Dataset
class(mtcars$mpg)
class(mtcars$cyl)
class(mtcars$disp)
class(mtcars$mpg)
class(mtcars$hp)
class(mtcars$wt)
class(mtcars$qsec)
class(mtcars$vs)
class(mtcars$am)
class(mtcars$gear)
class(mtcars$carb)

#To check the Structure of the Dataset
str(mtcars)

#This is to check if the variables are numeric or not
is.numeric(mtcars$mpg)
is.numeric(mtcars$cyl)
is.numeric(mtcars$disp)
is.numeric(mtcars$hp)
is.numeric(mtcars$drat)
is.numeric(mtcars$wt)
is.numeric(mtcars$qsec)
is.numeric(mtcars$vs)
is.numeric(mtcars$am)
is.numeric(mtcars$gear)
is.numeric(mtcars$carb)

##Question 4
#The . in the facet_grid -  facet into rows based on cyl
ggplot(data = mtcars) +
  geom_point(mapping = aes(x = disp, y = mpg)) +
  facet_grid(cyl ~ .)

#The . in the facet_grid - facet into columns based on am
ggplot(data = mtcars) +
  geom_point(mapping = aes(x = disp, y = mpg)) +
  facet_grid(. ~ am)

##Question 5
#Facets divide a plot into subplots based on the values of one or more discrete variables
?facet_wrap
#nrow and ncol stands for number of Rows and Columns
?facet_grid
#facet_grid() doesn't have nrow and ncol because it is controlled by the faceting variables.

##Question 6
ggplot(data = mtcars, mapping = aes(x = disp, y = mpg, color = cyl)) +
  geom_point() +
  geom_smooth(se = FALSE)
#The code does not run as it shows an error message. "Error: could not find function "gggplot"". 
#We would need to make sure that the function name is rightly typed.

##Question 7
?stat_summary
ggplot(data = mtcars) +
  stat_summary(
    mapping = aes(x = disp, y = mpg),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )
#deafault geom() - Used to override the default connection between geom_histogram/geom_freqpoly and stat_bin
#The default geom associated with stat_summary() is geom_pointrange()
#The plot can be rewritten in the following way to use geom_pointrange():
?geom_pointrange  
ggplot(data = mtcars)+
  geom_pointrange(
    mapping = aes(x = disp, y = mpg),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median,
  stat = "summary")

##Question 8
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() +
  geom_abline() +
  coord_fixed()
?geom_abline
#cty and hwy have a linear positve relationship. 
#coord_fixed forces a specified ratio between the physical representation of data units on the axes
#geom_abline is used to add straight lines to a plot. It can be either horizontal, vertical or specified by slope and intercept. 

##Question 9
#Load tidyverse
library(tidyverse)
#Plot for displ vs hwy
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))
#Map aesthetic to a variable, associate color to class of each car.
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = class))
#Plot to map size to the "class" variable
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, size = class))
#Plot to map transperancy to the "class" variable to reveal the class of each car.
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
#Plot to map shape to the "class" variable to reveal the class of each car.
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, shape = class))
#Plot using facet_wrap with 2 columns
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + facet_wrap(~ class, nrow = 2)
#Plot using facet_grid where drv and cyl are variables
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + facet_grid(drv ~ cyl)
#To plot a scatterplot
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))
#To plot a line plot with standard error
ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy))
#To plot a line plot to map linetypes to the "drv" variable to reveal car type of each car
ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))
#To plot a line plot
ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy))
#To plot a line plot with groups w.r.t drv variable
ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))
#To plot a line plot with different colored lines for different tpes of
cars
ggplot(data = mpg) + geom_smooth( mapping = aes(x = displ, y = hwy, color = drv), show.legend = FALSE)
#Scatterplot and lineplot in the same plot
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + geom_smooth(mapping = aes(x= displ, y = hwy))
#Simpler method to plot scatterplot and lineplot
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + geom_point() + geom_smooth()
#Scatterplot and lineplot in the same plot with color overriding in scatterplot
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + geom_point(mapping = aes(color = class)) + geom_smooth()
#Scatterplot and lineplot in the same plot with color overriding in scatterplot and filter in line plot
#ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + geom_point(mapping = aes(color = class)) + geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)
#Simple Bar plot w.r.t diamond cuts
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut))
#Making bar plots using stat_count()
ggplot(data = diamonds) + stat_count(mapping = aes(x = cut))
#To plot a bar plot with raw values of y
#demo <- tribble( ~cut, ~freq, "Fair", 1610, "Good", 4906, "Very Good", 12082, "Premium", 13791, "Ideal", 21551 ) ggplot(data = demo) + geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")
#To plot a bar plot for 'type of cut' and 'proportion'
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))

#To plot a line plot with the summary of the data
ggplot(data = diamonds) + stat_summary( mapping = aes(x = cut, y = depth), fun.ymin = min, fun.ymax= max, fun.y = median ) #Bar plot with colored borders ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, colour = cut))
#Bar plots with colored bars
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, fill = cut))
#Bar plots with stacking for cuts and clarity
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, fill = clarity))
#To make a bar plot to understand position"identity"
#ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + geom_bar(alpha = 1/5, position = "identity") ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + geom_bar(fill = NA,
#To flip the co-ordinate system or switch the x-y axis
#ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + geom_boxplot() ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + geom_boxplot() + coord_flip()
#To convert rectangular co-ordinates to polar co-ordinates
#bar <- ggplot(data = diamonds) + geom_bar( mapping = aes(x = cut, fill = cut), show.legend = FALSE, width = 1 ) + theme(aspect.ratio = 1) + labs(x = NULL, y = NULL) bar + coord_flip() bar + coord_polar()








