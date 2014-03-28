#!/bin/sh

readonly JENA_DIR="/opt/jena/"
readonly JENA_SRC="http://ftp.jaist.ac.jp/pub/apache//jena/binaries/apache-jena-2.11.1.tar.gz"

install_jena() {
    sudo wget $JENA_SRC -P $JENA_DIR
}

if [ -e $JENA_DIR ]; then
    echo "$JENA_DIR exists."
else
    echo "$JENA_DIR does not exist."
    install_jena
fi

# end of file
