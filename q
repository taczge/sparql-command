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
readonly PREFIXES="\
prefix rdf:         <http://www.w3.org/1999/02/22-rdf-syntax-ns#> \
prefix rdfs:        <http://www.w3.org/2000/01/rdf-schema#> \
prefix owl:         <http://www.w3.org/2002/07/owl#> \
prefix dbpedia:     <http://dbpedia.org/resource/> \
prefix dbpedia-owl: <http://dbpedia.org/ontology/> \
prefix dbpprop:     <http://dbpedia.org/property/> \
"
$CMD -service $END_POINT "$PREFIXES$1"

# end of file
