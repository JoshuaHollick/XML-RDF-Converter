/**
 * DataQualityInfo class stores the info in the DataQualityInfo section of GeoNetwork XML file
 * 
 * @author Wahhaj Ali
 */
public class DataQualityInfo {
	
	//DQ_Scope
	public String level;	 // gmd:MD_ScopeCode, ****Not sure if it should be String****

	//LI_Lineage
	public String statement; // gco:CharacterString

}
