open-advice
===========

Macros pour simplifier le travail de relecture


Le fichier 'macro' simplifie la lecture en convertissant l'html vers quelque chose de lisible.
De plus, il propose de corriger les espaces insécables obligatoires (devant !,?,;,:, etc.) ainsi que 
celles en fin de paragraphe, en demandant une confirmation visuelle.

Dans un shell, lancer :
vim -c 'argdo source macro' -c 'quit' openadvice.html

:x  pour enregistrer dans vim, :q!  pour quitter sans enregistrer


Le fichier 'orcam' reconvertit en html et s'assure que les apostrophes sont correctes.

Dans un shell, lancer :
vim -c 'argdo source orcam' -c 'quit' openadvice.html
