/**
 * JenaInterface provides an interface to Jena so RDF model can be easily opened, saved and edited.
 * @author Joshua Hollick
 */

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.InputStream;
import java.io.PrintStream;

import java.io.IOException;
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
		predicateMap = new TreeMap<String, String>();
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
	
	public Boolean readPredicatesFromFile(String filename) {
		/**
		 * Reads predicates from file and store them in a map for use when parsing the XML
		 */
		
		File file = new File(filename);
		StringBuffer contents = new StringBuffer();
		BufferedReader reader = null;

		try {
			reader = new BufferedReader(new FileReader(file));
			String text = null;

			System.out.println("Reading prefixes\n");
			
			// Read prefixes
			while ((text = reader.readLine()) != null) {
				if(text.isEmpty()) break;
				if(text.charAt(0) == '#') continue;		// Comment Line

				System.out.println(text);
				// TODO: save the prefixes
				//model.setNsPrefix("Prefix string ie vcard", "Full URI ie http://www.w3.org/2001/vcard-rdf/3.0#");
			}
			
			System.out.println("Reading predicates\n");
			
			// Read predicates
			while ((text = reader.readLine()) != null) {
				if(text.isEmpty()) continue;
				if(text.charAt(0) == '#') continue;		// Comment Line

				System.out.println(text);
				// TODO: Save the predicates
				//	predicateMap.put("Key used in XML", "RDF prefix");
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (reader != null) {
					reader.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return true;
	}
	
	public void insertGeoNetworkXMLObject(XMLDocument xmlDoc) {
		// TODO: Fix this
		Resource documentRoot = model.createResource("<URI>");
		
		Resource contactResource = documentRoot.addProperty(model.createProperty("<contactPredicate>"), model.createResource());
		
		contactResource.addProperty(model.createProperty(xmlDoc.contact.get("individualName_ns")), xmlDoc.contact.get("individualName"));
		
		// TODO: Iterate throuch contact
		
//		Resource identificationInfoResource = documentRoot createResource(...);
		
		// TODO: Iterate through identificationInfo
	}
}