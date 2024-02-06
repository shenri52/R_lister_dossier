#################### Statistiques du contenu de l'arborescence

#### Statistiques sur les fichiers

# Calcul du nombre de fichiers par extension
stat_fichier <- list_dossier %>%
                group_by(Extension) %>%
                summarize(Freq = n())

# Calcul du nombre total de fichiers dans l'arborescence
stat_fichier <- stat_fichier %>%
                add_row(Extension = "TOTAL", Freq = sum(stat_fichier$Freq))

# Calcul de la taille par extension
stat_taille_ext <- list_dossier %>%
                   group_by(Extension) %>%
                   summarize(Freq = sum(Taille_F)) %>%
                   mutate(Freq = case_when(
                                           Freq >= 1000000000 ~ paste(round(Freq/1000000000,2), "Go", sep =" "),
                                           Freq >= 1000000 ~ paste(round(Freq/1000000,2), "Mo", sep =" "),
                                           Freq >= 1000 ~ paste(round(Freq/1000,2), "Ko", sep =" "),
                                          .default = paste(Freq, "o", sep =" ")))

#### Statistiques sur les dossiers

# Calcul du nombre de fichier par dossier
stat_dossier <- list_dossier %>%
                group_by(Dossier_1) %>%
                summarize(Freq = n())

# Calcul de la taille total par dossier
stat_taille_dossier <- list_dossier %>%
                       group_by(Dossier_1) %>%
                       summarize(Freq = sum(Taille_F)) %>%
                       mutate(Freq = case_when(
                       Freq >= 1000000000 ~ paste(round(Freq/1000000000,2), "Go", sep =" "),
                       Freq >= 1000000 ~ paste(round(Freq/1000000,2), "Mo", sep =" "),
                       Freq >= 1000 ~ paste(round(Freq/1000,2), "Ko", sep =" "),
                       .default = paste(Freq, "o", sep =" ")))

# Export des données
write.table(stat_fichier,
            file = paste("result/stat_fichier_", substr(lecteur,1,1), ".csv", sep = ""),
            fileEncoding = "UTF-8",
            sep =";",
            row.names = FALSE)

write.table(stat_dossier,
            file = paste("result/stat_dossier_", substr(lecteur,1,1), ".csv", sep = ""),
            fileEncoding = "UTF-8",
            sep =";",
            row.names = FALSE)

write.table(stat_taille_dossier,
            file = paste("result/stat_taille_dossier_", substr(lecteur,1,1), ".csv", sep = ""),
            fileEncoding = "UTF-8",
            sep =";",
            row.names = FALSE)

write.table(stat_taille_ext,
            file = paste("result/stat_taille_ext_", substr(lecteur,1,1), ".csv", sep = ""),
            fileEncoding = "UTF-8",
            sep =";",
            row.names = FALSE)