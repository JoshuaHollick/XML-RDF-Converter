import java.io.File;
import java.io.IOException;
 
public class CombineAllRDFModels {
	public static void main(String args[]) {
		if(args.length != 2) {
			System.out.println("Usage : ConbineAllRDFModels [OUTPUTFILE] [Input Directory]");
			System.out.println("Gets all .rdf files and combines them into a single model");
			System.out.println("this model is then output to OUTPUTFILE.");
			return;
		}
		
		JenaRDFModel finalModel = new JenaRDFModel();
		String sourceDir = null;
		String uriBase = "http://www.isotc211.org/2005/gmd/gmd.xsd";

		File directory = new File(args[1]);
		
		// Needs to be a directory
		if(!directory.isDirectory()) {
			System.out.println("ERROR : " + args[1] + " is not a directory");
			return;
		}

		try {
			sourceDir = directory.getCanonicalPath();
		}
		catch(IOException e) {
			System.out.println(e);
			return;
		}
		
		String[] fileList = directory.list();
		
		if(0 == fileList.length) {
			System.out.println("ERROR : Directory appears empty");
		}
		
		for(Integer i = 0; i < fileList.length; i++) {
			// Only process those ending with .rdf
			if(!fileList[i].toLowerCase().endsWith(".rdf")) continue;
			
			String fullFilename = sourceDir + "/" + fileList[i];
			
			System.out.println("Adding : " + fullFilename);
			
			finalModel.addModel(new JenaRDFModel(fullFilename, uriBase));
		}
		
		System.out.println("Writing output to : " + args[0]);
		
		finalModel.writeModelToFile(args[0]);
	}
}