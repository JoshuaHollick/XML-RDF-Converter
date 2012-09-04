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

//private static String getTagValue(String sTag, Element eElement) {
//NodeList nlList = eElement.getElementsByTagName(sTag).item(0).getChildNodes();

//Node nValue = (Node) nlList.item(0);
//
//return nValue.getNodeValue();
//}

}