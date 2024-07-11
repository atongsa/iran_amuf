#!/usr/bin/env Rscript

# func
## wide_2_long
pixy_to_long <- function(pixy_files){

  pixy_df <- list()

  for(i in 1:length(pixy_files)){

    stat_file_type <- gsub(".*_|.txt", "", pixy_files[i])

    if(stat_file_type == "pi"){

      df <- read_delim(pixy_files[i], delim = "\t")
      df <- df %>%
        gather(-pop, -window_pos_1, -window_pos_2, -chromosome,
               key = "statistic", value = "value") %>%
        rename(pop1 = pop) %>%
        mutate(pop2 = NA)

      pixy_df[[i]] <- df


    } else{

      df <- read_delim(pixy_files[i], delim = "\t")
      df <- df %>%
        gather(-pop1, -pop2, -window_pos_1, -window_pos_2, -chromosome,
               key = "statistic", value = "value")
      pixy_df[[i]] <- df

    }

  }

  bind_rows(pixy_df) %>%
    arrange(pop1, pop2, chromosome, window_pos_1, statistic)

}

# run
library(tidyverse)

setwd("/public/home/d0202110815/at42/proj/iran_amuf/review/ssa/gene/dxy_fst/plot")

pixy_folder <- "../cal"
pixy_files <- list.files(pixy_folder, full.names = TRUE) # pattern='menz.*',
pixy_df <- pixy_to_long(pixy_files)

# kk
