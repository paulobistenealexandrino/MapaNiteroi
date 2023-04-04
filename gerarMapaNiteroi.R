# Fazendo um mapa dos bairros de Niterói - RJ


library(tidyverse)
library(geobr)
library(sf)
library(ggmap)


# Baixando os limites geográficos dos bairros
niteroi_bairros <- read_neighborhood() %>%
  # Filtrando para obter apenas as informações sobre Niterói
  filter(code_muni == 3303302)


# Baixando o basemap de Niterói
niteroi_basemap <- get_map(location = c(-43.05539,-22.91519),
                           zoom = 12,
                           maptype =  "terrain-background")


# Plotando o gráfico
ggmap(niteroi_basemap) +
  geom_sf(data = niteroi_bairros,
          fill = NA,
          inherit.aes = FALSE) +
  geom_sf_text(data = niteroi_bairros,
               aes(label = name_neighborhood), 
               size = 2,
               inherit.aes = FALSE) +
  labs(title = "Niterói",
       subtitle = "Limites de Bairros - 2010") +
  ylim(-23.00,-22.85) +
  theme_void()

