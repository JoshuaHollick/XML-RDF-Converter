public class TestJenaInterface {
	public static void main(String args[]) {
		JenaInterface ji = new JenaInterface("test.rdf", "http://www.isotc211.org/2005/gmd http://www.isotc211.org/2005/gmd/gmd.xsd");

		// ji.readPredicatesFromFile("predicates.txt");
		ji.writeModelToFile("TestModel.xml");
	}
}