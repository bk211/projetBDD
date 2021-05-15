# projetBDD

# Scripts de chargement
Il y a 3 scripts de chargement en tout

# create_all.sql -> créer toutes les tables ainsi que les fonctions et prepares associés <br>
Commande exacte: 
***\i scripts/create_all.sql***

# insert_data.sql -> si les tables sont créees, les charger de fausse données <br>
Command exacte:
***\i scripts/insert_data.sql*** <br>


# clear_data.sql -> vide toutes les données présentes dans les tables, sans supprimer la structure des tables (truncate)
Command exacte:
***\i scripts/clear_data.sql*** <br>

il existe d'autres scripts dans le répertoire scripts avec le même préfixe create_XXX et load_XXX,
ils permettent de créer ou de charger les tables avec le nom associé, c'est d'ailleurs ce que fait les 3 scripts ci-dessus<br>

# Répertoire demo
vous trouverez 3 scripts de demo dans le répertoires ***scripts/demo/***
Il s'agit de demo pour les 3 tables présentées dans le rapport. Pour les lancer, utiliser la commande suivante : <br>

***\i scripts/demo/demo_personne_test.sql*** <br>
***\i scripts/demo/demo_lieu_test.sql*** <br>
***\i scripts/demo/demo_test.sql*** <br>

# Répertoire scripts/chargement_donnée_gouvernement/
Il s'agit d'une répertoire qui charge des dataset de données du gouvernement

# Répertoire CSV_input
Vous trouverez toutes les donnée .csv de sources pour nos tables
