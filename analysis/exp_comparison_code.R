
rel_data <- terrorism_df %>% 
  filter(country_txt == "India") %>% 
  mutate(affected = nkill + nwound) %>% 
  select(country_txt, attacktype1_txt, nkill, nwound, affected) %>% 
  group_by(attacktype1_txt) %>%
  summarize(Killed = sum(nkill, na.rm = TRUE),
            Wounded = sum(nkill, na.rm = TRUE),
            naffected = sum(nkill, nwound, na.rm = TRUE)) %>% 
  gather(key = "Impact_Type", value = "affected",
         Killed, Wounded)

# Generate bar graph 
chart <- ggplot(rel_data) +
  geom_col(mapping = aes(x = reorder(attacktype1_txt, -affected), y = affected, 
                         fill = Impact_Type)) +
  ggtitle("Effects of Attack Types on Individuals") +
  xlab("Attack Type") +
  ylab("Number of People Affected") + 
  theme(plot.title = element_text(hjust = .5),
        axis.ticks = element_blank(),
        axis.text.x = element_text(angle = 90, hjust = 1))
chart

chart2 <- ggplot(rel_data) +
  geom_col(mapping = aes(x = reorder(attacktype1_txt, -affected), y = affected, 
                         fill = Impact_Type)) +
  ggtitle("Effects of Attack Types on Individuals") +
  xlab("Attack Type") +
  ylab("Number of People Affected") +
  coord_flip() +
  theme(plot.title = element_text(hjust = .5),
        axis.ticks = element_blank())
chart2

chart3 <- ggplot(rel_data) +
  geom_col(mapping = aes(x = attacktype1_txt, y = affected, 
                         fill = Impact_Type)) +
  ggtitle("Effects of Attack Types on Individuals") +
  xlab("Attack Type") +
  ylab("Number of People Affected") +
  coord_flip() +
  theme(plot.title = element_text(hjust = .5),
        axis.ticks = element_blank())
chart3

chart4 <- ggplot(rel_data) +
  geom_col(mapping = aes(x = attacktype1_txt, y = affected, 
                         fill = Impact_Type)) +
  ggtitle("Effects of Attack Types on Individuals") +
  xlab("Attack Type") +
  ylab("Number of People Affected") +
  theme(plot.title = element_text(hjust = .5),
        axis.ticks = element_blank(),
        axis.text.x = element_text(angle = 90, hjust = 1))
chart4


rel_data <- terrorism_df %>%
  filter(country_txt == "India") %>%
  mutate(affected = nkill + nwound) %>%
  dplyr::select(country_txt, attacktype1_txt, nkill, nwound, affected) %>%
  group_by(attacktype1_txt) %>%
  summarize(
    Killed = sum(nkill, na.rm = TRUE),
    Wounded = sum(nkill, na.rm = TRUE),
    naffected = sum(nkill, nwound, na.rm = TRUE)
  ) %>%
  gather(key = "Impact_Type", value = "affected", Killed, Wounded)

# Generate bar graph
chart <- ggplot(rel_data) +
  geom_col(mapping = aes(
    x = reorder(attacktype1_txt, -affected),
    y = affected, fill = Impact_Type
  )) +
  ggtitle(paste("Effects of Attack Types on Individuals in", "India")) +
  xlab("Attack Type") +
  ylab("Number of People Affected") +
  coord_flip() +
  theme(
    plot.title = element_text(hjust = .5),
    axis.ticks = element_blank(),
    axis.text.x = element_text(angle = 90, hjust = 1)
  )
# Return the bar graph
ggplotly(data = chart,
         text = "affected")


plot_ly(
  data = rel_data, # data frame to show
  x = ~attacktype1_txt, # variable for the x-axis, specified as a formula
  y = ~affected,
  # variable for the y-axis, specified as a formula
  type = "bar",   # create a chart of type "bar" -- a bar chart
  alpha = .7,     # adjust the opacity of the bars
  hovertext = "Impact_Type" # show the y-value when hovering over a bar
) %>%
  layout(
    title = "Number of new building permits per year in Seattle",
    xaxis = list(title = "Year"),
    yaxis = list(title = "Number of Permits"),
    barmode = 'stack'
  ) %>%
  add_trace(y = ~Impact_Type, "Affected")