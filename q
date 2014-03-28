#!/bin/sh

readonly JENA_DIR="/opt/jena"
readonly JENA_SRC="http://ftp.jaist.ac.jp/pub/apache//jena/binaries/apache-jena-2.11.1.tar.gz"
readonly JENA_LIB="`echo $JENA_SRC | sed -e 's/.*\///g'`"

if [ ! -e $JENA_DIR ]; then
    sudo wget $JENA_SRC -P $JENA_DIR
    sudo tar zxvf $JENA_DIR/$JENA_LIB -C $JENA_DIR
fi

readonly CMD="$JENA_DIR/`echo $JENA_LIB | sed -e 's/\.tar\.gz//g'`/bin/rsparql"
readonly END_POINT="http://dbpedia.org/sparql"

$CMD -service $END_POINT "$1"

# end of file
