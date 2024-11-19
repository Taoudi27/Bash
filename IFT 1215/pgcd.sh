# Auteurs: Amir Benhadid, Taoudi Bensouda
# Date de création: 22-04-2023
# Un script qui cherche le plus grand commun diviseur (PGCD) de deux nombres positifs avec l’algorithme d’Euclide
# à partir de deux paramètres positifs entrés


#!/bin/bash


# Vérifier le nombre de paramètres s'il est exactement égal à 2 sinon affiche une erreur et met fin à l'exécution
if [ "$#" -ne 2 ]; then
  echo "Erreur : Le script nécessite exactement 2 paramètres."
  exit 1
fi 

# Extraire les paramètres x et y
x="$1"
y="$2"

# Vérifier si les paramètres sont des nombres positifs sinon affiche une erreur et met fin à l'exécution
if [ "$1" -lt 0 -o "$2" -lt 0 ]; then
  echo "Erreur : Les paramètres doivent être des nombres positifs."
  exit 1
fi

# Vérifier si l'un des paramètres est nul, si le deuxième est nul, le programme affiche une erreur
# si seulemet l'un d'entre eux est nul, pgcd de x et 0 est x
if [ "$x" == 0 -o "$y" == 0 ]; then
	if [ "$x" == 0 ]; then
		if [ "$y" == 0 ]; then 
			echo "Erreur : Un des paramètres ne doit pas être égal à 0 (Division sur 0 n'est pas définie)."
			exit 1
		else	
			x="$y"
		fi
	elif [ "$y" == 0 ]; then
  		if [ "$x" == 0 ]; then
                	echo "Erreur : Un des paramètres ne doit pas être égal à 0."
        		exit 1
		fi
	fi
# Algorithme d'Euclide pour calculer le PGCD avec des soustractions
else
	while [ "$x" -ne "$y" ]; do           # La boucle itère tant que x != à y
  		if [ "$x" -gt "$y" ]; then          
    			x=$((x - y))                      # Soustrait y de x si x > y
  		else
    			y=$((y - x))                      # soustrait x de y sinon
  		fi
	done				      # Une fois la boucle terminée x = y
fi
# Afficher le PGCD des deux nombres
echo "Le PGCD de $1 et $2 est $x"
exit 0

