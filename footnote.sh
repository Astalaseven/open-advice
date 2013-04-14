#!/bin/sh


## pour le rendre exécutable : chmod +x footnote.sh
## usage : ./footnote.sh open-advice.html
## require : sed, awk, grep, perl, cat, echo, uniq, wc

#extraction des liens
perl -ln0e '$,="\n";print /(?<=<a title=).*?(?=<\/a>)/sg' $1 | sed -e 's/\"#.*$//' -e '/^$/d' -e 's/\"http/http/' | grep ">" | uniq > href.txt

#extraction des url
echo ">> extraction url"
cat href.txt | grep -o '^.*"' | sed -e 's/.*href=//' -e 's/".*//' -e '/^$/d' > url
#extraction des noms
echo ">> extraction nom"
cat href.txt | grep -o '>.*$' | sed -e 's/>//' -e '/^$/d' > nom
#extraction des title
echo ">> extraction title"
cat href.txt | grep -o '^.*\" ' | sed -e 's/\"//g' -e '/^$/d' > title

total=$(cat url | wc -l)
echo ">> Nombre de liens : $total"
i=1
while [ "$i" -le "$total" ]
do
	echo ">> Entrée dans la boucle"
	line=$(sed -n ""$i"p" "url")
	lien=$(sed -n ""$i"p" "nom")
	title=$(sed -n ""$i"p" "title")
	# escape les &
	lien=$(echo "$lien" | sed 's/&/\\&/g')
	
        if grep -q "$lien" $1; then
			echo line is $line
			echo lien is $lien
			echo title is $title
			sed -i 's,'"$lien"'</a>,'"$lien"'\\footnote\{'"$line"'\},' $1
			# nettoyage
			sed -i 's/ hreflang=\"..\"//g' $1
			sed -i 's,href=\"'"$line"'\">,,g' $1
			sed -i 's,href=\"'"$line"'\" >,,g' $1
			title=$(echo $title)
			sed -i 's,<a title=\"'"$title"'\" ,,' $1
						
	fi
	i=$(($i + 1))
done
