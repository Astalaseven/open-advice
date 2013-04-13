open-advice
===========

Macros pour simplifier le travail de relecture

* Les fichiers 'macro' et 'orcam' n'ont pas besoin d'extension de fichier. Il est préférable de les enregistrer 
dans le même dossier que le fichier à modifier.


* Le fichier 'macro' simplifie la lecture en convertissant l'html vers quelque chose de lisible.
De plus, il propose de corriger les espaces insécables obligatoires (devant !,?,;,:, etc.) ainsi que 
celles en fin de paragraphe, en demandant une confirmation visuelle.

Il est composé de plusieurs macros, utilisables uniquement avec vim.

Dans un terminal, lancer :
```vim -c 'argdo source macro' -c 'quit' openadvice.html```

`:x`  pour enregistrer dans vim, `:q!`  pour quitter sans enregistrer

Un autre éditeur peut être utilisé après utilisation du script.


* Le fichier 'orcam' reconvertit en html et s'assure que les apostrophes sont correctes.

Dans un terminal, lancer :
```vim -c 'argdo source orcam' -c 'quit' openadvice.html```

pour obtenir un fichier prêt à être copié dans le booktype.
