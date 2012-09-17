public class TestJenaInterface {
	public static void main(String args[]) {
		JenaInterface ji = new JenaInterface();
		
		ji.readPredicatesFromFile("predicates.txt");
		ji.writeModelToFile("TestModel.xml");
	}
}