#!/bin/bash

# Process all xml files in ./xml/ and put the 
# resulting rdf files in ./rdf/

mkdir rdf

cd xml
filelist=`ls *.xml`
cd ..

for file in $filelist ; do
	echo "Processing $file..."
	xsltproc -o ./rdf/$file.rdf xml2rdf.xsl ./xml/$file
done

rm clean.xml