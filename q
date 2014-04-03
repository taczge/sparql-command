#!/bin/sh

readonly END_POINT="http://dbpedia.org/sparql"
readonly PREFIXES="\
prefix rdf:         <http://www.w3.org/1999/02/22-rdf-syntax-ns#> \
prefix rdfs:        <http://www.w3.org/2000/01/rdf-schema#> \
prefix owl:         <http://www.w3.org/2002/07/owl#> \
prefix dbpedia:     <http://dbpedia.org/resource/> \
prefix dbpedia-owl: <http://dbpedia.org/ontology/> \
prefix dbpprop:     <http://dbpedia.org/property/> \
"
rsparql -service $END_POINT "$PREFIXES$1"

# end of file
