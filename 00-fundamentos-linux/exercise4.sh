#!/bin/bash

TARGET="https://thebestortilla.com/"
SEARCHED_WORD="patata"
FILE_NAME="result.txt"

curl -s $TARGET > $FILE_NAME

WORD_COUNT=$(cat $FILE_NAME | grep -o -i $SEARCHED_WORD  | wc -w)

if [ $WORD_COUNT -eq 0 ]; then
  echo "No se ha encontrado la palabra $SEARCHED_WORD"
else
  FIRST_OCCURRENCE_LINE=$(grep -n -i $SEARCHED_WORD $FILE_NAME | head -n 1 | cut -d: -f1)
  echo "La palabra $SEARCHED_WORD aparece $WORD_COUNT veces"
  echo "Aparece por primera vez en la línea $FIRST_OCCURRENCE_LINE"
fi
