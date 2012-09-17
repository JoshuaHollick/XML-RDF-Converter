/*
	Original source: http://www.javacodegeeks.com/2012/01/xml-parsing-using-saxparser-with.html
	Adaptions to GeoNetwork: CITS3200 Project Group A 2012, University of Western Australia
	Email: 20517617@student.uwa.edu.au
*/

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class readxml extends DefaultHandler {
    //List<Book> bookL; - replace this with objects for pulling out of XML
    String xmlFileName;
    String tmpValue;
    String tmpKey;
    Boolean inside;
    
    Map<String,String> tmpMap;
    Map<String,String> miscMap;
    
    XMLDocument tmpDoc;
    
    //Book bookTmp;
    SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
    
    /*
    	Constructor for this class
    	Parses doc, then prints it out
    */
    public readxml(String xmlFileName) {
        this.xmlFileName = xmlFileName;
        
        //initialise the XML doc to store temp data
        tmpDoc = new XMLDocument();
        
        miscMap = new HashMap<String,String>; //misc XML fields
        inside = false; //not inside a specific region (see XMLDocument)
        
        parseDocument();
        
        tmpDoc.misc = miscMap; //insert that misc map into XMLDoc instance
        
        printDatas();
    }
    
    /*
    	Baseline code for parsing the XML doc - unmodified
    */
    private void parseDocument() {
        // parse
        SAXParserFactory factory = SAXParserFactory.newInstance();
        try {
            SAXParser parser = factory.newSAXParser();
            parser.parse(xmlFileName, this);
        } catch (ParserConfigurationException e) {
            System.out.println("ParserConfig error");
        } catch (SAXException e) {
            System.out.println("SAXException : xml not well formed");
        } catch (IOException e) {
            System.out.println("IO error");
        }
    }
    
    /*
    	Print function
    	Requires alteration
    */
    private void printDatas() {
       // System.out.println(bookL.size());
        for (Book tmpB : bookL) {
            System.out.println(tmpB.toString());
        }
    }
    
    /*
    	Callback triggered at the beginning of each XML element
    */
    @Override
    public void startElement(String s, String s1, String elementName, Attributes attributes) throws SAXException {
    	
    	if(elementName.equalsIgnoreCase("gmd:CI_ResponsibleParty") || elementName.equalsIgnoreCase("gmd:CI_OnlineResource") || elementName.equalsIgnoreCase("gmd:MD_DataIdentification") || elementName.equalsIgnoreCase("gmd:dataQualityInfo")) {
	    	tmpMap = new HashMap<String,String>;
	    	inside = true;
    	}
    	
    	if(!(elementName.equalsIgnoreCase("gco:CharacterString") || elementName.equalsIgnoreCase("gmd:URL") || elementName.equalsIgnoreCase("gco:DateTime"))) { 
	    	tmpKey = elementName;
	    	if(inside) {
	    		String ns = attributes.getValue("xmlns:wms");
	    		if(ns != '') {
		    		tmpMap.put(tmpKey+"_ns",ns); //store the namespace for an element, if it exists
		    	}
		    }
    	}

        if (elementName.equalsIgnoreCase("book")) {
            bookTmp = new Book();
            bookTmp.setId(attributes.getValue("id"));
            bookTmp.setLang(attributes.getValue("lang"));
        }
        // if current element is publisher
        if (elementName.equalsIgnoreCase("publisher")) {
            bookTmp.setPublisher(attributes.getValue("country"));
        }
    }
    
    /*
    	Callback triggered at the end of each XML element
    */
    @Override
    public void endElement(String s, String s1, String element) throws SAXException {
        
        /*
        	If we reach the end of a particular region, finished with the tmpMap for that
        */
        if(elementName.equalsIgnoreCase("gmd:CI_ResponsibleParty")) {
	    	tmpDoc.contact = tmpMap;
	    	inside = false;
    	}
    	else if(elementName.equalsIgnoreCase("gmd:CI_OnlineResource")) {
	    	tmpDoc.onlineResources.add(tmpMap); //add a new onlineResource element to the XMLDocument class holder
	    	inside = false;
    	}
    	else if(elementName.equalsIgnoreCase("gmd:MD_DataIdentification")) {
    		tmpDoc.identificationInfo = tmpMap;
	    	inside = false;
    	}
    	else if(elementName.equalsIgnoreCase("gmd:dataQualityInfo")) {
	    	tmpDoc.dataQualityInfo = tmpMap;
	    	inside = false;
    	}
        
        /*
        	If we're inside a region, store strings and stuff we encounter in the tmpMap
        	If we're outside, store in generic holder	
        */
        if(elementName.equalsIgnoreCase("gco:CharacterString") || elementName.equalsIgnoreCase("gmd:URL") || elementName.equalsIgnoreCase("gco:DateTime")) {
	    	if(inside) {
		    	//save result temp temp keyval pair.
		    	tmpMap.put(tmpKey,tmpValue);	
	    	}
	    	else {
		    	miscMap.put(tmpKey,tmpValue);
	    	}
    	}
    	/**
    		Need to alter to capture "<gmd:protocol>OGC:WFS-1.1.0-http-get-feature</gmd:protocol>" for example
    	*/
    	
		/*
		examples        
        if (element.equalsIgnoreCase("title")) {
            bookTmp.setTitle(tmpValue);
        }
        if(element.equalsIgnoreCase("author")){
           bookTmp.getAuthors().add(tmpValue);
        }
        if(element.equalsIgnoreCase("price")){
            bookTmp.setPrice(Integer.parseInt(tmpValue));
        }
        if(element.equalsIgnoreCase("regDate")){
            try {
                bookTmp.setRegDate(sdf.parse(tmpValue));
            } catch (ParseException e) {
                System.out.println("date parsing error");
            }
        }
        */
    }
    
    /*
    	Callback triggered capturing string elements between open and closing tags
    */
    @Override
    public void characters(char[] ac, int i, int j) throws SAXException {
        tmpValue = new String(ac, i, j);
    }
    
    public static void main(String[] args) {
        new readxml(args[0]);
    }
}