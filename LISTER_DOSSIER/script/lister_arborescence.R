#################### Lister le contenu d'une arborescence

# Afficher une boîte de dialogue pour indiquer le lecteur à analyser

lecteur <- NULL

while (is_empty(lecteur))
{
  lecteur <- dlg_dir(default = getwd(), title = "Choisir le dossier à analyser")$res
}

# Récupérer la liste des fichiers
list_dossier <- list.files(path = lecteur,
                           full.names = TRUE,
                           recursive = TRUE) %>%
                           # Récupérer la taille et la date de modification
                           file.info() %>%
                           select(size, mtime)

# Modification du format de la date
list_dossier$mtime <- as_date(list_dossier$mtime)
  
# Création d'un dataframe avec le nom du chemin, le nom du fichier et le type d'extension
list_dossier <- list_dossier %>%
                mutate(Chemin = dirname(row.names(list_dossier))) %>%
                mutate(Fichier = basename(row.names(list_dossier))) %>%
                mutate(Extension = as.factor(toupper(sub("^.+\\.", "", Fichier))))
  
# Suppression des noms de ligne
row.names(list_dossier) <- NULL
  
# Modification du nom des colonnes
colnames(list_dossier) <- c("Taille_F", "Modif_F", "Chemin", "Fichier", "Extension")
  
# Afficher une boîte de dialogue pour filtrer les données
ext_list <- dlgInput("Voulez vous choisir les extensions à lister ? (oui ou non)")$res

# Filtrage des fichiers en fonction des extensions
if (ext_list == "oui")
{
  # Création de la liste des extensions
  ext <- list_dossier %>%
         select(Extension) %>%
         group_by(Extension) %>%
         summarize(.Freq = n()) %>%
         spread(Extension, .Freq)
  
  # Afficher un message d'information
  dlg_message("Choissisez les extensions à lister")
  
  # Afficher une boîte de dialogue pour choisir les extensions à lister
  ext <- dlg_list(c("Toutes", colnames(ext)), multiple = TRUE, preselect = NULL, title = "Extensions A LISTER ")$res %>%
         as.data.frame() %>%
         mutate(SUP = 1) %>%
         rename.variable(".", "Extension")
  
  # Contrôle de la saisie
  ### Pas d'extensions choisies
  if (is.na(ext[1,1]))
  {
    ext[1,1] <- "Toutes"
  }

  ### Choix multiples incluant "Toutes"
  if (count(ext) > 1)
  {
    ext <- ext %>%
           filter(Extension != "Toutes")
  }
  
  # Filtrage des données
  if (ext[1,1] != "Toutes")
  {
    list_dossier <- full_join(list_dossier, ext) %>%
                    filter(!is.na(SUP)) %>%
                    select(-SUP)
  }
}

# Séparation du chemin en morceaux (Lecteur, Dossier1, Dossier2...)
morceaux_chemin <- strsplit(list_dossier$Chemin, "/")

# Nombre maximum de morceaux (= nombre de colonnes)
nb_col <- max(sapply(morceaux_chemin, length))

# Création d'une matrice pour stocker les morceaux  
mat_morceaux <- matrix("",
                       nrow = length(morceaux_chemin),
                       ncol = nb_col)

# Remplissage de la matrice avec les morceaux
for (i in 1:length(morceaux_chemin))
{
  mat_morceaux[i, 1:length(morceaux_chemin[[i]])] <- morceaux_chemin[[i]]
}

# Conversion de la matrice en dataframe
mat_morceaux <- as.data.frame(mat_morceaux)

# Renommage des colonnes
colnames(mat_morceaux) <- c("Lecteur", paste("Dossier", seq_len(nb_col - 1), sep = "_"))

# Rassemblement des informations
list_dossier <- cbind(mat_morceaux,
                      select(list_dossier, -Chemin))

# Export des données
write.table(list_dossier,
            file = paste("result/contenu_", substr(lecteur,1,1), ".csv", sep = ""),
            fileEncoding = "UTF-8",
            sep =";",
            row.names = FALSE)