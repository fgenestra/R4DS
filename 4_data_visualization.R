# __________________________________________________________
#    0 - Load necessary packages
# __________________________________________________________

library(tidyverse)


# __________________________________________________________
#    1 - Exploring Raw Data
# __________________________________________________________

ggplot2::mpg
dim(mpg)


# __________________________________________________________
#    2 - Plotting the Data
#   
#   “The greatest value of a picture is when it forces us 
#   to notice what we never expected to see.” — John Tukey
# __________________________________________________________

#geom_point()

ggplot(mpg, aes(displ, hwy)) + 
  geom_point()

ggplot(mpg, aes(displ, hwy)) + 
  geom_point(position = "jitter") # to avoid overplotting

ggplot(mpg, aes(displ, hwy)) + 
  geom_jitter() #shorthand version

ggplot(mpg, aes(displ, hwy, color = class)) + 
  geom_point()

ggplot(mpg, aes(displ, hwy, size = class)) + 
  geom_point()

ggplot(mpg, aes(displ, hwy, alpha = class)) + 
  geom_point() # alpha defines the transparency

ggplot(mpg, aes(displ, hwy, shape = class)) + 
  geom_point(color = "red") # limited to 6 shapes

ggplot(mpg, aes(displ, hwy, color = displ >= 5)) + 
  geom_point()

ggplot(mpg, aes(displ, hwy)) + geom_point() + 
  facet_wrap(~ class, nrow = 2)

ggplot(mpg, aes(displ, hwy)) + geom_point() + 
  facet_grid(drv ~ cyl) # four dimensions

ggplot(mpg, aes(displ, hwy)) + geom_point() + 
  facet_grid(. ~ cyl) # three dimensions

ggplot(mpg, aes(displ, hwy)) + geom_point() + 
  facet_grid(drv ~ .) # three dimensions


#geom_smooth()

ggplot(mpg, aes(displ, hwy)) + 
  geom_smooth()

ggplot(mpg, aes(displ, hwy, linetype = drv)) + 
  geom_smooth()

ggplot(mpg, aes(displ, hwy, group = drv)) + 
  geom_smooth()

ggplot(mpg, aes(displ, hwy, color = drv)) + 
  geom_smooth()


#overlap geoms

ggplot(mpg, aes(displ, hwy)) + 
  geom_smooth() + 
  geom_point()

ggplot(mpg, aes(displ, hwy)) + 
  geom_smooth(aes(color = class)) + 
  geom_point()

ggplot(mpg, aes(displ, hwy)) + 
  geom_smooth() + 
  geom_point(aes(color = class))


#recreate exercise

ggplot(mpg, aes(displ, hwy)) + 
  geom_smooth(se = F) + 
  geom_point()

ggplot(mpg, aes(displ, hwy)) + 
  geom_smooth(se = F, aes(group = drv)) + 
  geom_point()

ggplot(mpg, aes(displ, hwy)) + 
  geom_smooth(aes(group = drv, color = drv), se = F) + 
  geom_point(aes(color = drv))

ggplot(mpg, aes(displ, hwy)) + 
  geom_smooth(se = F) + 
  geom_point(aes(color = drv))

ggplot(mpg, aes(displ, hwy)) + 
  geom_smooth(se = F, aes(linetype = drv)) + 
  geom_point(aes(color = drv))

ggplot(mpg, aes(displ, hwy)) + 
  geom_point(aes(color = drv))


#statistical transformations

ggplot(diamonds, aes(cut)) + 
  geom_bar()

ggplot(diamonds, aes(cut)) + 
  geom_bar(aes(y = ..prop.., group = 1))

ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

#position adjustments

ggplot(diamonds, aes(cut, color = cut)) + 
  geom_bar()

ggplot(diamonds, aes(cut, fill = cut)) + 
  geom_bar()

ggplot(diamonds, aes(cut, fill = clarity)) + 
  geom_bar() # fill with a second variable

ggplot(diamonds, aes(cut, fill = clarity)) + 
  geom_bar()

ggplot(diamonds, aes(cut, fill = clarity)) + 
  geom_bar(alpha = 1/2)

ggplot(diamonds, aes(cut, fill = clarity)) + 
  geom_bar(alpha = 1/2, position = "identity")

ggplot(diamonds, aes(cut, color = clarity)) + 
  geom_bar(fill = NA, position = "identity")

ggplot(diamonds, aes(cut, fill = clarity)) + 
  geom_bar(position = "fill") #change in the position for a stacked view

ggplot(diamonds, aes(cut, fill = clarity)) + 
  geom_bar(position = "dodge") #change in the position for a beside one another view

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point(position = "jitter")


#Coordinate systems

nz <- map_data("nz")
ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black") +
  coord_quickmap()

bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)
bar + coord_flip()
bar + coord_polar()

ggplot(mpg, aes(class, hwy)) + 
  geom_boxplot()

ggplot(mpg, aes(class, hwy)) + 
  geom_boxplot() + coord_flip()

ggplot(diamonds, aes(cut, fill = cut)) + 
  geom_bar(show.legend = F, width = 1) + labs(x = NULL, y = NULL) + coord_flip()

ggplot(diamonds, aes(cut, fill = cut)) + 
  geom_bar(show.legend = F, width = 1) + labs(x = NULL, y = NULL) + coord_polar()

ggplot(dota = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

fliter(mpg, cyl = 8)
filter(diamond, carat > 3)