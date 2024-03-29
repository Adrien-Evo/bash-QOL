# bash-QOL

![alt text](QUOLL.png?raw=true "Un QUOLL dans un bash, pic by http://www.creturfetur.com/")

Ce tuto a pour but d'aider les utilisateurs de bash dans leurs utilisation quotidienne du terminal. Les utilisateurs visés sont des utilisateurs occasionnels ou régulier du terminal. Cependant cette ressource peut être utile pour des utilisateurs débutants une fois familiarisés.


Vous pouvez cloner ce tuto sur votre machine en local avec git :
```
git clone https://github.com/Adrien-Evo/bash-QOL.git
```

## Les raccourcis du bash

Votre premier raccourci pour aujourd'hui, sur Ubuntu et la plupart des distribution linux pour lancer un terminal :

```Ctrl + Alt + t```

### Gérer une ligne de commande imposante

Il n'est pas rare de rencontrer dans la nature des commandes de taille imposantes qui vont tester votre patience :

```
plotFingerprint -b /sandbox/users/foucal-a/Projects/Chip-Seq-POSCHMANN/pyflow-ChIPseq/out/03aln/DC1074_H3K4me1.sorted.bam /sandbox/users/foucal-a/Projects/Chip-Seq-POSCHMANN/pyflow-ChIPseq/out/03aln/DC1074_H3K27.sorted.bam /sandbox/users/foucal-a/Projects/Chip-Seq-POSCHMANN/pyflow-ChIPseq/out/03aln/DC1074_H3K27me3.sorted.bam /sandbox/users/foucal-a/Projects/Chip-Seq-POSCHMANN/pyflow-ChIPseq/out/03aln/DC1074_Input.sorted.bam /sandbox/users/foucal-a/Projects/Chip-Seq-POSCHMANN/pyflow-ChIPseq/out/03aln/DC1074_H3K4me3.sorted.bam --plotFile /sandbox/users/foucal-a/Projects/Chip-Seq-POSCHMANN/pyflow-ChIPseq/DC1074TESTINGchr1.fingerprint.png --labels DC1074_H3K4me1 DC1074_H3K27 DC1074_H3K27me3 DC1074_Input DC1074_H3K4me3 --plotTitle DC1074 --outRawCounts /sandbox/users/foucal-a/Projects/Chip-Seq-POSCHMANN/pyflow-ChIPseq/out/DPQC/DC1074.plotFingerprintOutRawCounts.txt --outQualityMetrics /sandbox/users/foucal-a/Projects/Chip-Seq-POSCHMANN/pyflow-ChIPseq/out/DPQC/DC1074.plotFingerprintOutQualityMetrics.txt --region 1 --numberOfSamples 50000 --minMappingQuality 30
```
Pour vous aidez :
```
Meta + f avancer d'un mot
Meta + b reculer d'un mot
ctrl + w supprimer le dernier mot
ctrl + u supprimer la ligne
ctrl + c supprimer la commande
```

Nettoyer votre terminal avec ```ctrl + l``` peut remplacer la commande ```clear```


Un [lien compilant la plupart des raccourcis bash](https://ss64.com/bash/syntax-keyboard.html)

## L'historique

Les commandes lancées dans le bash sont stockées dans un historique, le fichier *~/.bash_history*. Notez que la taille de votre historique est indiquée et contrôlée par votre fichier *~/.bashrc* :
```
HISTSIZE=1000
HISTFILESIZE=2000
```
Une fois dans le terminal, vous pouvez accéder à l'historique avec ```Ctrl + r ```. Une fois dans la *reverse-i-search* :

```
Ctrl + r : recherche en arrière 
Ctrl + s : recherche en avant
```

Ctrl + s peut ne pas marcher. Pour faire marcher ce raccourci très pratique, ajoutez ceci dans votre *~/.bashrc* :

```
#Disable the XON/XOFF flow control to have the proper ctrl + s shortcut for forward history search
stty -ixon
```
et relancer votre terminal. Solution trouvée [ici](https://stackoverflow.com/questions/791765/unable-to-forward-search-bash-history-similarly-as-with-ctrl-r). Nous aborderons l'utilisation des fichiers de configuration bash *bashrc* et *bash_aliases* plus tard dans ce tuto.



## tldr : man n'est pas aidant

Un exemple:
```
man grep
```
L'outil d'aide *man* peut s'avérer trop verbeux pour retrouver une simple option. [L'outil tldr](https://tldr.sh/) peut vous aider.
Multiples options d'installation et une interface web. Avec pip sur votre conda base par exemple :

```
pip install tldr
```
Maintenant vous pouvez utiliser *tldr* pour le reste des commandes que nous allons voir !

## pwd
Une commande très simple, qui vous indique votre position ```pwd```

## which
Cette commande va pouvoir vous dire la localisation des outils bash :

```which grep```
```which samtools```

## file

Cette commande vous donne de précieuses informations sur la nature des fichiers, comme par exemple quels sont les symboles de fin de ligne qui peuvent causer des erreurs dans vos scripts, si vous travaillez sur des fichiers textes crées sur Windows.

## dos2unix

Cette commande remplace les fins de ligne windows par des fin de ligne unix (retour chariot windows à Unix: CRLF -> \n)
## readlink

Il est souvent plus sur de travailler avec les chemins absolus des fichiers. Pour cela vous pouvez utilisez ```readlink -f``` ou ```realpath```. Les différences entre ces outils sont détaillés sur ce [thread](https://unix.stackexchange.com/questions/136494/whats-the-difference-between-realpath-and-readlink-f)

## find et locate

Un autre outil très pratique pour trouver un fichier, la commande ```find```

```
find . -name bashrc
```

*find* est **extrêmement** utile. Cette commande peut par exemple trouver tous les fichiers *.txt* de votre système :
```
find . -name "*.txt*" -type f
```

Il faut pouvoir aussi exclure certain dossier de la recherche :
```
find . -name "*.txt*" -type f -not -path "./miniconda3/*"
```

```locate``` fait la même chose, en plus rapide. Pas forcément disponible et moins de fonctionnalité par contre. 
Les différences entre find et locate : [thread stackoverflow](https://unix.stackexchange.com/questions/60205/locate-vs-find-usage-pros-and-cons-of-each-other)

Quelques exemples de commande find avec tldr:
```
tldr find
```
Une ressource web sur [find](http://www.hypexr.org/linux_find_help.php)

## xargs

xargs construit et  exécute des commandes à partir de l'input standard *stdin*. Pour chaque argument de stdin (séparé par un espace dans le mode par défaut) xargs exécute une commande. Exemple : 
``` 
echo un.tmp deux.tmp trois.tmp | xargs touch
```
xargs est particulièrement utile pour lier entre eux des commandes qui initialement n'accepte pas la lecture en stdin, comme touch, ls mkdir ...

Une des utilisations les plus courantes de xargs se fait avec ```find``` combiné avec d'autres commande de modification de fichier. Ici nous cherchons dans tous les fichiers finissant par *.txt* la chaîne de caractères *abc* :
```
find -name "*.txt" -type f | xargs grep "abc"
```
Cette commande va créer des erreurs. xargs par default utilise un espace pour séparer les arguments. Des espaces et des retours chariots peuvent aussi etre présent dans les noms de fichiers. On combine donc :
* ```-print0``` pour afficher le chemin absolu des fichiers et les séparer par un caractère nul (et pas un retour chariot)
* ```-0``` pour utiliser le caractère nul  

La nouvelle commande devient :
```
find -name "*.txt" -print0 | xargs -0 grep "abc"
```

Un autre exemple où wc est utilisé pour connaître le nombre de ligne par fichier
```
find -name "*.txt" -print0 | xargs -0 wc -l
```

Utilisation simple de conversion d'un texte multi ligne en mono ligne
```
ls 
ls | xargs
```
Une option bien pratique pour permettre à xargs d'etre utilisé de manière plus souple : sh -c "expression"
```
find *txt -print0 | xargs -0 -I {} sh -c "echo {};grep chat {} > {}.output"
```
Cela permet de rajouter des pipes et d'autres commandes !


Liens :
* https://shapeshed.com/unix-xargs/
* https://www.tecmint.com/xargs-command-examples/

## du

Nous prenons tous des libertés avec notre usage de l'espace disque. Une bonne façon de connaître la taille de nos différents dossiers et fichiers et d'utiliser la commande ```du``` (pour *disk usage*).

```
du
du -h
du -ah
du -hsc *
```


## ps, top, htop

Pour surveiller les différents *process* sur votre machine

```ps -ef | less```
```top```
Une version plus sympa de top, htop : 

```
sudo apt-get install htop
htop
```
## zless zcat zgrep zdiff

Ces outils vous évite d'avoir à décompresser des fichiers tar gz ou zip. Equivalent de : ```zcat fichier.gz | command```

## column 

Les fichiers type csv peuvent être  difficile à visualiser avec less. Essayez :

```
less example.bed
```
vs
```
column -t example.bed | less
```

## bashrc:

Le fichier ~/.bashrc est le fichier principal de configuration de votre terminal. C'est un script shell qui est lancé automatiquement quand votre terminal est lancé (interactive non-login shell, X11 style). Il peut contenir :
* des options de customisation visuelle de votre terminal
* des options de customisation fonctionnelle de votre terminal (eg. autocompletion)
* La gestion de vos différents exécutables via la variable $PATH
* Des alias de commandes

Vous avez normalement deja un fichier .bashrc sur votre $HOME

## bash_aliases

Je recommande d'utiliser le fichier ~/.bash_aliases pour les alias de commande plutôt que bashrc.
Pour l'essayer (si vous avez déja cloné le repo git) :
```
cd
cp .bash_aliases{,bak}
find . -name ".bash_aliases" -type f 2> /dev/null | grep bash-QOL | xargs -Iargs cp args ~/
```

Quelques ressources sur les différents aliases
https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html

https://jonsuh.com/blog/git-command-line-shortcuts/


## Le bash c'est difficile
Débugger du shell est frustrant. Les messages d'erreurs sont sibyllins. Cet outil peut vous aider :
https://www.shellcheck.net/#

## Customiser son bash
Il est possible de customiser son bash avec des plugins comme [powerline](https://github.com/powerline/powerline):

![alt text](powerline_shell.PNG?raw=true "Un exemple de shell avec powerline")

Assez facile à installer avec pip :
```
pip install powerline-status
```
Puis ajouter ceci dans le *~/.bashrc*:

```
# Powerline installed with PIP install powerline-status https://github.com/powerline/powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /home/af/miniconda3/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh
```

Vous verrez que votre prompt est maintenant différent. Cependant la configuration de powerline n'est pas très facile. Mérite d'être fouillé plus avant.

Petite mention, il existe aussi plusieurs "versions" du terminal :
* bash
* Zsh
* Fish
* Rcsh


## TMUX

[Lien vers une autre repo avec le tuto Tmux](https://github.com/Adrien-Evo/tmux-tuto)
