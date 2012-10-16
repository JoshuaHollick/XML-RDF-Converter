#!/bin/bash

# Process all rdf files in ./rdf/ and put the 
# resulting rdf files in ./converted-xml/

mkdir converted-xml

cd rdf
filelist=`ls *.rdf`
cd ..

for file in $filelist ; do
	echo "Processing $file..."
	xsltproc -o ./converted-xml/$file.xml rdf2xml.xsl ./rdf/$file
done