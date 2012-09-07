/**
 * IdentificationInfo class stores the info in the IdentificationInfo section of GeoNetwork XML file
 * 
 * @author Joshua Hollick
 */
public class IdentificationInfo {
	
	// CI_Citation
	public String title;	// gco:CharacterString
	public Date date;	// gco:DateTime
	public String dateTypeCode;	// gmd:CI_DateTimeCode

	public String abstract;	// gco:CharacterString

	public String status;	// gmd:MD_ProgressCode

	public String descriptiveKeywords;	// May need to be string list
	
	// Resource Constraints -> MD_LegalConstraints
	public String accessConstraints;	// gco:CharacterString

	// Spatial Representation Type
	public String MD_SpatialRepresentationTypeCode;
	
	public String language;	// gco:CharacterString

	public String characterSet;
	
	public String topicCategory;	// gmd:MD_TopicCategoryCode

	// extent -> EX_Extent -> geographicElement -> EX_GeographicBoundingBox
	public Double westBound;
	public Double eastBound;
	public Double northBound;
	public Double southBound;
}