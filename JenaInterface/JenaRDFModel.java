/**
 * JenaInterface provides an interface to Jena so RDF model can be easily opened, saved and edited.
 * @author Joshua Hollick
 */

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.PrintStream;

import java.io.IOException;
import java.io.FileNotFoundException;

import java.util.TreeMap;

import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.rdf.model.ModelFactory;
import com.hp.hpl.jena.rdf.model.Resource;


public class JenaRDFModel {
	private Model model;
	private TreeMap<String, String> predicateMap;
	
	/**
	 * Creates an empty RDF model
	 */
	JenaRDFModel() {
		model = ModelFactory.createDefaultModel();
		predicateMap = new TreeMap<String, String>();
	}
	
	/**
	 * Reads the model from filename, completing any relative URI's with base.
	 * If there are no relative URI's base can be null.
	 */
	JenaRDFModel(String filename, String base) {
		predicateMap = new TreeMap<String, String>();
		readModelFromFile(filename, base);
	}

	/**
	 * Reads a model from a file overwriting the current model.
	 * Any relative URI's are completed with base. If there are no relative URI's
	 * then base can be null.
	 */
	private Boolean readModelFromFile(String filename, String base) {
		InputStream inputFile = null;
		
		try {
			inputFile = new FileInputStream(filename);
		}
		catch(FileNotFoundException e) {
			System.out.println(e);
			System.out.println("Error opening file...");
			return false;
		}
		
		if(null == inputFile) {
			System.out.println("Undefined error");
			throw new IllegalArgumentException("File: " + filename + " not found");
		}
		
		// Create empty model then read the file
		model = ModelFactory.createDefaultModel();
		model.read(inputFile, base);
		
		try {
			inputFile.close();
		}
		catch(IOException e) {
			System.out.println("Error closing file...");
			return false;
		}
		
		return true;
	}
	
	/**
	 * Combines adds jenaModel to this model
	 */
	public void addModel(JenaRDFModel jenaModel) {
		model.add(jenaModel.model, false);
	}
	
	/**
	 * Combines adds jenaModel to this model
	 */
	public void addModel(JenaRDFModel jenaModel, Boolean suppressReifiedStatements) {
		model.add(jenaModel.model, suppressReifiedStatements);
	}
	
	/**
	 * Writes this model out to an RDF/XML file specified by filename
	 */
	public Boolean writeModelToFile(String filename) {
		PrintStream outputFile = null;
		
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
}