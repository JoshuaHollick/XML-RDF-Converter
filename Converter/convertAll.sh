#!/bin/bash

# Process all xml files in ./xml/ and put the 
# resulting rdf files in ./rdf/

mkdir rdf

cd xml
filelist=`ls *.xml`
cd ..

for file in $filelist ; do
	echo "Processing $file..."
	xsltproc -o clean.xml xmlcleanup.xsl ./xml/$file
	xsltproc -o ./rdf/$file.rdf xml2rdf3.xsl clean.xml
done

rm clean.xml