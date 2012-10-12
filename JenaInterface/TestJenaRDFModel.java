public class TestJenaRDFModel {
	public static void main(String args[]) {
		JenaRDFModel ji = new JenaRDFModel("190488.rdf", "http://www.isotc211.org/2005/gmd/gmd.xsd");

		// ji.readPredicatesFromFile("predicates.txt");
		ji.writeModelToFile("TestModel.xml");
		
		ji.writeXML();
	}
}