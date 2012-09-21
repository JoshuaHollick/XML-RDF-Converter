/**
 * DistributionInfo class stores the info in the DistributionInfo section of GeoNetwork XML file
 * 
 * @author Wahhaj Ali
 */
public class DistributionInfo {
	
	
	//MD_Format
	public String name;		// gco:CharacterString
	public String version; 	// gco:CharacterString

	//CI_OnlineResource
	public String linkage;		// gmd:URL
	public String protocol;		// gco:CharacterString
	public String onLineName;	// gco:CharacterString
	public String description;	// gco:CharacterString
}
