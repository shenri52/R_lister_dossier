# Script R : lister_dossier

Ce script permet de lister le contenu d'une arborescence de dossiers, de donner des informations statistiques simple sur son contenu et d'indiquer la présence de doublons.

## Descriptif du contenu

* Racine : emplacement du projet R --> "LISTER_DOSSIER.Rproj"
* Un dossier "result" pour le stockage du résultat
* Un dosssier script qui contient :
  * prog_lister_dossier.R --> script principal
  * librairie.R --> script contenant les librairies utiles au programme
  * lister_arborescence.R --> script permettant de lister le contenu d'une arborescence
  * recherche_doublon.R --> script permettant de détecter les fichiers en double
  * statistique --> script réalisant des statistiques simple sur les fichiers
  * suppression_gitkeep.R --> script de suppression des .gitkeep

## Fonctionnement

1. Lancer le script intitulé "prog_lister_dossier" qui se trouve dans le dossier "script"

## Résultat

Le dossier "result" contiendra :
   * un tableau nommé 'contenu_X' avec la liste des fichiers, leur emplacements, leur tailles, et leurs dates de modification
   * un tableau nommé 'stat_fichier_X' avec le nombre de fichiers par extension
   * un tableau nommé 'stat_dossier_X' avec le nombre de sous-dossiers par dossiers principaux
   * un tableau nommé 'stat_taille_dossier_X' avec la taille de chaque dossiers
   * un tableau nommé 'stat_taille_ext_X' avec la taille de chaque extensions
   * un tableau nommé 'doublon_nom_taille_X' avec les fichiers ayant un nom et une taille idenstique
   * un tableau nommé 'doublon_taille_X' avec les fichiers ayant une taille identique
   * un tableau nommé 'doublon_nom_X' avec les fichiers ayant un nom identique

Le X dans le nom des tableaux correspond au lecteur sur lequel sont stockées les données.
