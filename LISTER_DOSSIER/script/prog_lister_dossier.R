#######################################################################################
# Ce programme permet  objectif de lister le contenu d'une arborescence de dossiers,  #
# de donner des informations statistiques simple sur son contenu et d'indiquer la     #
# présence de doublons.                                                               #
#######################################################################################
# Fonctionnement :                                                                    #
#     1 - création de la liste des fichiers et de leur emplacement                    #
#                                                                                     #
# Résultat :                                                                          #
#     * un tableau nommé 'contenu_X' avec la liste des fichiers, leur emplacements,   #
#     leurs tailles, et leurs dates de modification                                   #
#     * un tableau nommé 'stat_fichier_X' avec le nombre de fichiers par extension    #
#     * un tableau nommé 'stat_dossier_X' avec le nombre de sous-dossiers par         #
#     dossiers principaux                                                             #
#     * un tableau nommé 'stat_taille_dossier_X' avec la taille de chaque dossiers    #
#     * un tableau nommé 'stat_taille_ext_X' avec la taille de chaque extensions      #
#     * un tableau nommé 'doublon_nom_taille_X' avec les fichiers ayant un nom et une #
#     taille identique                                                                # 
#     * un tableau nommé 'doublon_taille_X' avec les fichiers ayant une taille        #
#     identique                                                                       #
#     * un tableau nommé 'doublon_nom_X' avec les fichiers ayant un nom identique     #
#                                                                                     #  
# Le X dans le nom des tableaux correspond au lecteur sur lequel sont stockées les    #
# données                                                                             #
#######################################################################################

#################### Chargement des librairies

source("./script/librairie.R")

#################### Suppression des fichiers gitkeep

source("script/suppression_gitkeep.R")

#################### Lister le contenu d'une arborescence

source("./script/lister_arborescence.R")

#################### Statistiques sur le contenu de l'arborescence

source("./script/statistique.R")

#################### Recherche des doublons

source("./script/recherche_doublon.R")
