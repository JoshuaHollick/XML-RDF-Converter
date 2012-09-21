import java.io.File;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class readxml extends DefaultHandler {
	
	public static void main(String[] args) throws Exception {
		
		DefaultHandler handler = new readxml();

		SAXParserFactory factory = SAXParserFactory.newInstance();
        factory.setValidating(false);
        
        SAXParser parser = factory.newSAXParser();
        
        parser.parse(new File(args[0]), handler);
		
	}
	
	@Override
	public void startElement(String uri, String localName, String qName,
			Attributes attributes) throws SAXException {
		
		// get the number of attributes in the list
        int length = attributes.getLength();

        // process each attribute
        for (int i=0; i<length; i++) {
        	
            // get qualified (prefixed) name by index
            String name = attributes.getQName(i);
            System.out.println("Name:" + name);
            
            // get attribute's value by index.
            String value = attributes.getValue(i);
            System.out.println("Value:" + value);

            // get namespace URI by index (if parser is namespace-aware)
            String nsUri = attributes.getURI(i);
            System.out.println("NS Uri:" + nsUri);

            // get local name by index
            String lName = attributes.getLocalName(i);
            System.out.println("Local Name:" + lName);
            
        }
		
	}

}


/*
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;
import java.io.File;
 
public class readxml {
 
	public static void main(String argv[]) {

		try {

			//Reads in the file from first argument 
			File fXmlFile = new File(argv[0]);
			
			//DocumentBuilder class used for reading direct XML code into the DOM
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			
			//parses the XML code into the DOM
			Document doc = dBuilder.parse(fXmlFile);
			doc.getDocumentElement().normalize();
	
			//Read in the document encapsulating element (Should be gmd:MD_Metadata for us)
			Node root = doc.getDocumentElement();  
			System.out.println("The root element is " + root.getNodeName() + ".\n"); //Node Name is gmd:MD_Metadata.
			
			NodeList emptyTextNodes = doc.getElementsByTagName("\n"); 
			
			for (int i = 0; i < emptyTextNodes.getLength(); i++) {
				Node emptyTextNode = emptyTextNodes.item(i);
				emptyTextNode.getParentNode().removeChild(emptyTextNode);
			}
			
			//Begin recursing on children of that element.
			recurseLevel(root, 0);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static String recurseLevel(Node root, int level) {
		try {       
			int recurse = 1;
		
			//Character string type used frequently.
			if(root.getNodeName() == "gco:CharacterString") {
				for(int i=0; i<=level; i++) System.out.print("\t");
				System.out.println("Node (level "+level+"):"+root.getNodeName()+" = "+root.getFirstChild().getNodeValue());
				recurse = 0;
			}
			else if(root.getNodeType() != root.TEXT_NODE) {
				for(int i=0; i<=level; i++) System.out.print("\t");
				
				System.out.println("Node (level "+level+"):"+root.getNodeName()+" - "+root.getNodeValue());
				
				//this is the code to be improved
				//ns needs to be variable based on the bit before the colon in "getNodeName" -- this links to a namespace address as specified at the top of the page
				String ns = "http://www.w3schools.com/children/";
				root.getAttributeNS(ns,"lang");
				//end
				
			}
			else recurse = 0;
		
			//Only recurse for certain node types (i.e. not gco:CharacterString)
			if(recurse == 1) {
				//Recurse through the children of this node.
				NodeList children = root.getChildNodes();  
		
				for (Node child = root.getFirstChild(); child != null; child = child.getNextSibling()) {  
					recurseLevel(child, level+1);
				} 
			}
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "";
	}


}*/