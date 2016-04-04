
 function vimg() {
     files=`git grep -Ie $1 | sed -e 's/:.*$//' | sort -u`
     vim $files +/$1
 }

