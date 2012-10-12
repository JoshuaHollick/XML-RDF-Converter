public class TestJenaRDFModel {
	public static void main(String args[]) {
		JenaRDFModel ji = new JenaRDFModel("test.rdf", null);

		// ji.readPredicatesFromFile("predicates.txt");
		ji.writeModelToFile("TestModel.xml");
	}
}