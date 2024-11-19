# Auteurs: Amir Benhadid, Taoudi Bensouda
# Date de création: 22-04-2023
# Un script permettant de chercher un encodage positionnel d’un nombre entier en base 10 vers n’importe quelle base
# entre 2 et 9 incluse.



#!/bin/bash


# Vérifier le nombre d'arguments s'il est égal à exactement 2 sinon afficher un message d'erreur et terminer l'exécution
if [ "$#" -ne 2 ]; then
  echo "Erreur : Le script nécessite exactement 2 arguments."
  exit 1
fi

# Vérifier si la base est valide (entre 2 et 9 inclus) sinon afficher un message d'erreur et terminer l'exécution
if [ "$2" -lt 2  -o "$2" -gt 9 ]; then     # L'argement 2 étant la base (entré en second)
  echo "Erreur : La base doit être un nombre entier entre 2 et 9 inclus."     # Messasge d'erreur sinon
  exit 1
fi

# Vérifier si le nombre entré est un entier (positif ou négatif)
if ! echo "$1" | grep -E -q '^[-+]?[0-9]+$'; then   # Vérifier si le nombre est précédé par 0 ou 1 signe "+" ou "-"
  echo "Erreur : Le nombre doit être un entier, éventuellement précédé d'un signe '+' ou '-'."  # Message d'erreur sinon
  exit 1
fi

# Extraire le signe du nombre
base="$2"    # Définir la variable "base" comme étant l'arguement 2
signe=""     # Définir la variable "signe" (signe de l'encodage positionnel)
abs=""       # Définir la variable "abs" (valeur absolue du nombre entré en paramètre)


# Détérminer la valeur absolue du nombre
digits=$(echo "$1" | grep -o '[0-9]')   # Sert à tirer les chiffres, sans les signes "+" ou "-"

for digit in $digits; do                # Sert à organiser les chiffres tirés en un seul nombre (nombre de départ)
  abs="${abs}${digit}"
done
nombre="$abs"                           # Variable nombre devient la valeur absolue de notre nombre pour appliquer 
                                        # l'encodage positionnel sur la valeur absolue


# Déterminer le signe					
if [ "$1" -ge 0 ]; then
  signe="+"                             # Si l'input est positif le signe "+"
elif [ "$1" -lt 0 ]; then     
  signe="-"                             # Le signe "-" sinon
fi



# Convertir le nombre en base spécifiée en tirant à chaque fois le reste, le mettre dans le résultat
# Diviser le nombre par la base, puis refaire l'opération jusqu'à ce que la valeur absolue soit nulle
resultat=""                             # Variable pour contenir le résultat au cours de la conversion
if [ "$nombre" == 0 ]; then   			# Si la valeur absolue du nombre est nulle afficher 0 sans signe
	resultat="0"
	signe=""
else
	while [ "$nombre" -ne 0 ]; do     	# Tant que la valeur absolue n'est pas nulle
  		reste=$((nombre % base))              # Le reste est calcule par la division complète du nombre par la base
  		resultat="$reste$resultat"		# Le resultat ajoute le reste à gauche à chaque itération
  		nombre=$((nombre / base))		# La valeur absolue est maintenant diviser par la base et met fin à l'itération
	done
fi

# Afficher le résultat avec le signe approprié
echo "L'encodage positionnel du nombre $signe$abs en base $base est $signe$resultat" 
exit 0

