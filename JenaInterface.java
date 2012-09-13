/**
 * JenaInterface provides an interface to Jena so RDF model can be easily opened, saved and edited.
 * @author Joshua Hollick
 */

import java.io.InputStream;
import java.io.PrintStream;
import java.io.FileNotFoundException;
import java.util.TreeMap;

import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.rdf.model.ModelFactory;
import com.hp.hpl.jena.rdf.model.Resource;
//import com.hp.hpl.jena.util.FileManager;

public class JenaInterface {
	private Model model;
	private TreeMap<String, String> predicateMap;
	
	JenaInterface() {
		model = ModelFactory.createDefaultModel();
		predicateMap = new TreeMap();
	}

	public Boolean readModelFromFile(String filename) {
		// Currently doesn't work since it needs Filemanager which I can't import for some reason
		
/*		InputStream inputFile = Filemanager.get().open(filename);
		
		if(null == inputFile) {
			throw new IllegalArgumentException("File: " + inputFileName + " not found");
			return false;
		}
		
		// Create empty model then read the file
		model = ModelFactory.createDefaultModel();
		model.read(inputFile, null);
		
		inputFile.close();
		
		return true;*/
		return false;
	}
	
	public Boolean writeModelToFile(String filename) {
		PrintStream outputFile;
		
		try {
			outputFile = new PrintStream(filename);
		}
		catch(FileNotFoundException e) {
			System.out.println(e);
			System.out.println("Unable to write model to this file...");
			return false;
		}
		
		// TODO: Check Jena docs to see if this returns anything useful.
		model.write(outputFile);
		
		outputFile.close();
		
		return true;
	}
	
	public Boolean readPredicatesFromFile(String Filename) {
		/**
		 * Reads predicates from file and store them in a map for use when parsing the XML
		 */
		
		// Set prefixes with:
		//	model.setNsPrefix("Prefix string ie vcard", "Full URI ie http://www.w3.org/2001/vcard-rdf/3.0#");
		
		// Store predicates with:
		//	predicateMap.put("Key used in XML", "RDF prefix");
		
		
		return false;
	}
	
	public void InsertGeoNetworkXMLObject() {
		
		
		Resource contactResource = model.createResource(contact.individualName_ns + "/" + contact.individualName);
		
		
	}
}