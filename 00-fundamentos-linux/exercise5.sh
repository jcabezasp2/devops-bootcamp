#!/bin/bash


if [[ $# -lt 2 ]]; then
  echo "Se necesitan dos argumentos"
  exit 1
else
  if [[ $# -gt 2 ]]; then
    echo "Se necesitan únicamente dos parámetros para ejecutar este script"
    exit 1
  fi
fi


TARGET=$1
SEARCHED_WORD=$2
FILE_NAME="result.txt"

curl -s $TARGET > $FILE_NAME

WORD_COUNT=$(cat $FILE_NAME | grep -o -i $SEARCHED_WORD  | wc -w)

if [ $WORD_COUNT -eq 0 ]; then
  echo "No se ha encontrado la palabra \"$SEARCHED_WORD\""
elif [ $WORD_COUNT -eq 1 ]; then
  FIRST_OCCURRENCE_LINE=$(cat $FILE_NAME | grep -n -i $SEARCHED_WORD | cut -d: -f1)
  echo "La palabra \"$SEARCHED_WORD\" aparece $WORD_COUNT vez"
  echo "Aparece unicamente en la línea $FIRST_OCCURRENCE_LINE"
else
  FIRST_OCCURRENCE_LINE=$(cat $FILE_NAME | grep -n -i $SEARCHED_WORD | head -n 1 | cut -d: -f1)
  echo "La palabra \"$SEARCHED_WORD\" aparece $WORD_COUNT veces"
  echo "Aparece por primera vez en la línea $FIRST_OCCURRENCE_LINE"
fi
