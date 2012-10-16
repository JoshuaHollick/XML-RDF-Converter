#!/bin/bash

# Process all xml files in ./xml/ and put the 
# resulting rdf files in ./converted-rdf/

mkdir converted-rdf

cd xml
filelist=`ls *.xml`
cd ..

for file in $filelist ; do
	echo "Processing $file..."
	xsltproc -o ./converted-rdf/$file.rdf xml2rdf.xsl ./xml/$file
done