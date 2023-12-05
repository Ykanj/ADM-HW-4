#!/bin/bash

# What is the most-watched Netflix title?

# Extract the title column (column 4) from the CSV file, excluding the header (NR > 1)
# Remove double quotes from titles, count occurrences, and sort by count in descending order
# Extract the most-watched title, remove leading whitespace, and store it in the variable 'most_watched_title'
most_watched_title=$(
  awk -F ',' 'NR > 1 {gsub(/\"/, ""); print $4}' vodclickstream_uk_movies_03.csv |  # Rimuovi le virgolette e estrai la colonna dei titoli
  sort | uniq -c | sort -nr | head -n 1 |                                          # Conta le occorrenze, ordina per conteggio e prendi il primo (il più alto)
  awk '{$1=""; print $0}' | sed 's/^[ \t]*//'                                       # Rimuovi il conteggio e spazi iniziali
)
echo "Most-Watched Netflix title: $most_watched_title"


# Report the average time between subsequent clicks on Netflix.com

# Extract the duration column (column 3) from the CSV file, excluding the header (NR > 1)
# Calculate the sum of durations and the average duration
average_duration=$(
  awk -F ',' 'NR > 1 {print $3}' vodclickstream_uk_movies_03.csv |  # Estrai la colonna delle durate escludendo l'header
  awk '{sum += $1} END {print sum / NR}'                              # Calcola la somma delle durate e la media alla fine
)
echo "Average Time between subsequent clicks: $average_duration seconds"


# Provide the ID of the user that has spent the most time on Netflix

# Sum the durations for each user, sort by total duration in descending order,
# extract the user with the most time spent, and remove leading whitespace
user_with_most_time=$(
  awk -F ',' 'NR > 1 {sum[$NF] += $3} END {for (user in sum) print user, sum[user]}' vodclickstream_uk_movies_03.csv |  # Somma le durate per ogni utente
  sort -k2 -nr | head -n 1 |                                         # Ordina per durata totale e prendi il primo (il più alto)
  awk '{print $1}'                                                  # Estrai solo l'ID dell'utente
)
echo "ID of the user with the most time spent on Netflix: $user_with_most_time"
