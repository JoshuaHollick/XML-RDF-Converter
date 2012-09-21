/**
 * IdentificationInfo class stores the info in the IdentificationInfo section of GeoNetwork XML file
 * 
 * @author Joshua Hollick
 */
public class IdentificationInfo {
	
	// CI_Citation
	String title;		// gco:CharacterString
	Date date;		// gco:DateTime
	String dateTypeCode;	// gmd:CI_DateTimeCode

	String abstractStr;	// gco:CharacterString

	String status;		// gmd:MD_ProgressCode

	String descriptiveKeywords;	// May need to be string list
	
	// Resource Constraints -> MD_LegalConstraints
	String accessConstraints;	// gco:CharacterString

	// Spatial Representation Type
	String MD_SpatialRepresentationTypeCode;
	
	String language;	// gco:CharacterString

	String characterSet;
	
	String topicCategory;	// gmd:MD_TopicCategoryCode

	// extent -> EX_Extent -> geographicElement -> EX_GeographicBoundingBox
	Double westBound;
	Double eastBound;
	Double northBound;
	Double southBound;
}