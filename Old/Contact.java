/**
 * contact class stores baseline contact XML file information after parsing it
 * @author Cameron Fitzgerald
 */
public class Contact {
	//Enclosed in gmd:contact
	//Enclosed in gmd:CI_ResponsibleParty

	String individualName; //eg. Bruce Simons (enclosed in gco:CharacterString)
	String individualName_ns; //eg. http://www.opengis.net/wms

	String organisationName; //enclosed in gco:CharacterString
	String organisationName_ns; //eg. as above

	String positionName; //enclosed in gco:CharacterString
	String positionName_ns; //eg. as above

	String contactInfo_ns; //eg. as above

	String CI_Telephone_voice; //enclosed in gco:CharacterString
	String CI_Telephone_facsimile; //enclosed in gco:CharacterString

	String CI_Address_city; //enclosed in gco:CharacterString
	String CI_Address_administrativeArea; //enclosed in gco:CharacterString
	String CI_Address_postalCode; //enclosed in gco:CharacterString 
	String CI_Address_country; //enclosed in gco:CharacterString

	String CI_onlineResource_URL; 

	String CI_RoleCode_codeList; //attribute
	String CI_RoleCode_codeListValue; //attribute
}