#################### Recherche des doublons

#### Même nom et même taille

# Recherche des fichiers avec le même nom
doublon_nt <- list_dossier[duplicated(list_dossier$Fichier) | duplicated(list_dossier$Fichier , fromLast = T),]

# Conservation des fichiers avec la même taille
doublon_nt <- doublon_nt[duplicated(doublon_nt$Taille_F) | duplicated(doublon_nt$Taille_F , fromLast = T),]


#### Même taille mais nom différent
doublon_t <- list_dossier[duplicated(list_dossier$Taille_F) | duplicated(list_dossier$Taille_F , fromLast = T),]


#### Même nom mais taille différente
doublon_n <- list_dossier[duplicated(list_dossier$Fichier) | duplicated(list_dossier$Fichier , fromLast = T),]


# Export des données
write.table(doublon_nt,
            file = paste("result/doublon_nom_taille_", substr(lecteur,1,1), ".csv", sep = ""),
            fileEncoding = "UTF-8",
            sep =";",
            row.names = FALSE)

write.table(doublon_t,
            file = paste("result/doublon_taille_", substr(lecteur,1,1), ".csv", sep = ""),
            fileEncoding = "UTF-8",
            sep =";",
            row.names = FALSE)

write.table(doublon_n,
            file = paste("result/doublon_nom_", substr(lecteur,1,1), ".csv", sep = ""),
            fileEncoding = "UTF-8",
            sep =";",
            row.names = FALSE)
