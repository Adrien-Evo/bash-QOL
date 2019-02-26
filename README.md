# bash-QOL
Ce tuto a pour but d'aider les utilisateurs de bash dans leurs utilisation quotidienne du terminal. Les utilisateurs visés sont des utilisateurs occasionnels ou régulier du terminal qui savent utiliser bash et le terminal. Cependant cette ressource peut être utile pour des utilisateurs débutants une fois familiarisés.

![alt text](http://url/to/img.png)
## Les racourcis du bash

https://ss64.com/bash/syntax-keyboard.html
On peut faire pas mal de chose en bash en utilisant les raccourcis de base. D'abord, le premier :

Lancer un terminal : '''Ctrl + Tab + t```
### Avancer/reculer d'un mot

Utile pour des commandes imposantes
```
plotFingerprint -b /sandbox/users/foucal-a/Projects/Chip-Seq-POSCHMANN/pyflow-ChIPseq/out/03aln/DC1074_H3K4me1.sorted.bam /sandbox/users/foucal-a/Projects/Chip-Seq-POSCHMANN/pyflow-ChIPseq/out/03aln/DC1074_H3K27.sorted.bam /sandbox/users/foucal-a/Projects/Chip-Seq-POSCHMANN/pyflow-ChIPseq/out/03aln/DC1074_H3K27me3.sorted.bam /sandbox/users/foucal-a/Projects/Chip-Seq-POSCHMANN/pyflow-ChIPseq/out/03aln/DC1074_Input.sorted.bam /sandbox/users/foucal-a/Projects/Chip-Seq-POSCHMANN/pyflow-ChIPseq/out/03aln/DC1074_H3K4me3.sorted.bam --plotFile /sandbox/users/foucal-a/Projects/Chip-Seq-POSCHMANN/pyflow-ChIPseq/DC1074TESTINGchr1.fingerprint.png --labels DC1074_H3K4me1 DC1074_H3K27 DC1074_H3K27me3 DC1074_Input DC1074_H3K4me3 --plotTitle DC1074 --outRawCounts /sandbox/users/foucal-a/Projects/Chip-Seq-POSCHMANN/pyflow-ChIPseq/out/DPQC/DC1074.plotFingerprintOutRawCounts.txt --outQualityMetrics /sandbox/users/foucal-a/Projects/Chip-Seq-POSCHMANN/pyflow-ChIPseq/out/DPQC/DC1074.plotFingerprintOutQualityMetrics.txt --region 1 --numberOfSamples 50000 --minMappingQuality 30
```
```
Meta + f
Meta + b
ctrl + w
ctrl + u
```
### L'historique
Une des commandes les plus importante en bash
```
Ctrl + r : recherche en arrière 
Ctrl + s : recherche en avant
```
Ctrl + s peut ne pas marcher. Pour faire marcher ce raccourci très pratique, ajoutez ceci dans votre .bashrc:
```
#Disable the XON/XOFF flow control to have the proper ctrl + s shortcut for forward history search
stty -ixon
```
Solution trouvée [ici](https://stackoverflow.com/questions/791765/unable-to-forward-search-bash-history-similarly-as-with-ctrl-r)

## Man n'est pas aidant
La commande man accede à la page d'aide des outils du terminal. Cependant, il peut être long de trouver la bonne options parmi toutes celles disponible.
exemple : man grep
l'outil tdlr https://tldr.sh/ peut vous aider

## find et locate

Un autre outil très pratique pour trouver un fichier, la commande '''find``````find . -name bashrc
```
http://www.hypexr.org/linux_find_help.php

locate fait la meme chose, en plus rapide. Moins de fonctionnalité par contre

Les différences entre find et locate : [thread stackoverflow](https://unix.stackexchange.com/questions/60205/locate-vs-find-usage-pros-and-cons-of-each-other)

## xargs



## du

## ps

## pwd

## realpath et readlink
## bashrc:

Le fichier ~/.bashrc est le fichier principal de configuration de votre terminal. C'est un script shell qui est lancé automatiquement quand votre terminal est lancé (interactive non-login shell, X11 style). Il peut contenir :
* des options de customisation visuelle de votre terminal
* des options de customisation fonctionnelle de votre terminal (eg. autocompletion)
* La gestion de vos différents exécutables via la variable $PATH
* Des alias de commandes

## bash_aliases

Je recommande d'utiliser le fichier ~/.bash_aliases pour les alias de commande plûtot que bashrc.
Un exemple de bash_aliases :



https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html

### Aliases pour git
https://jonsuh.com/blog/git-command-line-shortcuts/

## Le bash c'est difficile
Débugger du shell est frustrant. Les messages d'erreurs sont sibyllins. Cet outil peut vous aider :
https://www.shellcheck.net/#


