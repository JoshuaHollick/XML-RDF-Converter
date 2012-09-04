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


		//Read in the document encapsulating element (Should be gmd:MD_Metadata for us)
		Element root = doc.getDocumentElement();  
		System.out.println("The root element is " + root.getNodeName() + ".\n"); //Node Name is gmd:MD_Metadata.
		
		NamedNodeMap rootAttr = root.getAttributes();
		
       
NodeList children = root.getChildNodes();  
System.out.print("There are "+children.getLength()+" child elements.\n");  
System.out.print("They are: \n");  

for (Node child = root.getFirstChild();child != null;child = child.getNextSibling()) { 
recurseLevel(child); 
if (child.getNodeType() == child.TEXT_NODE){  
System.out.println("Text: "+child.getNodeValue());  
} else if (child.getNodeType() == child.ELEMENT_NODE) {  
System.out.println(child.getNodeName()+" = "+child.getFirstChild().getNodeValue());  
//   if()  
}  
} 

} catch (Exception e) {
e.printStackTrace();
}
}

private static String recurseLevel(Element root) {
try {
//read the "root" element and check if it has children

//if it has one child, find the text element within that child

//else recurse

System.out.println("The root element is " + root.getNodeName() + ".\n");  
       
NodeList children = root.getChildNodes();  
System.out.print("There are "+children.getLength()+" child elements.\n");  
System.out.print("They are: \n");  

for (Node child = root.getFirstChild();child != null;child = child.getNextSibling()) {  
if (child.getNodeType() == child.TEXT_NODE){  
System.out.println("Text: "+child.getNodeValue());  
} else if (child.getNodeType() == child.ELEMENT_NODE) {  
System.out.println(child.getNodeName()+" = "+child.getFirstChild().getNodeValue());  
//   if()  
}  
} 

} catch (Exception e) {
e.printStackTrace();
}
}
}

private static String getTagValue(String sTag, Element eElement) {
NodeList nlList = eElement.getElementsByTagName(sTag).item(0).getChildNodes();

Node nValue = (Node) nlList.item(0);

return nValue.getNodeValue();
}

}