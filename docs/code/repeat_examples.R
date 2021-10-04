# Reference: https://www.r-graph-gallery.com/81-barplot-with-variable-width.html
online <- table_1 %>% filter(variables == 'Online Class')
h1 <- ggplot(data=online, aes(ymin = 0)) +
  geom_rect(aes(xmin = left_interval, xmax = right_interval, ymax = total), show.legend = F, fill = '#56B4E9') +
  scale_x_continuous(breaks=as.numeric(c(0.0, online$right_interval, max(table_1$right_interval))), limits=c(0.0, max(table_1$right_interval))) +
  scale_y_continuous(breaks=c(seq(0, max(online$total),100), round(max(table_1$total),-2)), limits=c(0, max(table_1$total))) +
  labs(title = 'Online Class', x='Time Interval (hours/day)', y = 'Total') +
  theme_bw()

# Alternative to getting variable width
# width = as.numeric(online$left_interval) - as.numeric(online$right_interval)
# h1 <- ggplot(data=online, aes(x = right_interval+width/2, y= total)) +
#   geom_bar(stat = 'identity', width=width, show.legend = F, fill = '#56B4E9') +
#   scale_x_continuous(breaks=as.numeric(c(0.0, online$right_interval, max(table_1$right_interval))), limits=c(0.0, max(table_1$right_interval))) +
#   scale_y_continuous(breaks=c(seq(0, max(online$total),100), round(max(table_1$total),-2)), limits=c(0, max(table_1$total))) +
#   labs(title = 'Online Class', x='Time Interval (hours/day)', y = 'Total') +
#   theme_bw()

self_study <- table_1 %>% filter(variables == 'Self-Study')
h2 <- ggplot(data=self_study, aes(ymin = 0)) +
  geom_rect(aes(xmin = left_interval, xmax = right_interval, ymax = total), show.legend = F, fill = '#56B4E9') +
  scale_x_continuous(breaks=as.numeric(c(0.0, self_study$right_interval, max(table_1$right_interval))), limits=c(0.0, max(table_1$right_interval))) +
  scale_y_continuous(breaks=c(seq(0, max(self_study$total),100), round(max(table_1$total),-2)), limits=c(0, max(table_1$total))) +
  labs(title = 'Self-Study', x='Time Interval (hours/day)', y = 'Total') +
  theme_bw()

fitness <- table_1 %>% filter(variables == 'Fitness')
h3 <- ggplot(data=fitness, aes(ymin = 0)) +
  geom_rect(aes(xmin = left_interval, xmax = right_interval, ymax = total), show.legend = F, fill = '#56B4E9') +
  scale_x_continuous(breaks=as.numeric(c(0.0, fitness$right_interval, max(table_1$right_interval))), limits=c(0.0, max(table_1$right_interval))) +
  scale_y_continuous(breaks=c(seq(0, max(fitness$total),100), round(max(table_1$total),-2)), limits=c(0, max(table_1$total))) +
  labs(title = 'Fitness', x='Time Interval (hours/day)', y = 'Total') +
  theme_bw()


sleep <- table_1 %>% filter(variables == 'Sleep')
h4 <- ggplot(data=sleep, aes(ymin = 0)) +
  geom_rect(aes(xmin = left_interval, xmax = right_interval, ymax = total), show.legend = F, fill = '#56B4E9') +
  scale_x_continuous(breaks=as.numeric(c(0.0, sleep$right_interval, max(table_1$right_interval))), limits=c(0.0, max(table_1$right_interval))) +
  scale_y_continuous(breaks=c(seq(0, max(sleep$total),100), round(max(table_1$total),-2)), limits=c(0, max(table_1$total))) +
  labs(title = 'Sleep', x='Time Interval (hours/day)', y = 'Total') +
  theme_bw()

social_media <- table_1 %>% filter(variables == 'Social Media')
h5 <- ggplot(data=social_media, aes(ymin = 0)) +
  geom_rect(aes(xmin = left_interval, xmax = right_interval, ymax = total), show.legend = F, fill = '#56B4E9') +
  scale_x_continuous(breaks=as.numeric(c(0.0, social_media$right_interval, max(table_1$right_interval))), limits=c(0.0, max(table_1$right_interval))) +
  scale_y_continuous(breaks=c(seq(0, max(social_media$total),100), round(max(table_1$total),-2)), limits=c(0, max(table_1$total))) +
  labs(title = 'Social Media', x='Time Interval (hours/day)', y = 'Total') +
  theme_bw()

grid.arrange(h1,h2,h3,h4,h5, nrow=3)
