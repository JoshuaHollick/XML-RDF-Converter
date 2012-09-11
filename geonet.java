/**
 * geonet class stores baseline GeoNetwork XML file information after parsing it
 * @author Cameron Fitzgerald
 */
public class geonet {

	String fileIdentifier; //eg. 021f6856-7064-4225-8f0d-eeeb747321b1 (enclosed in gco:CharacterString)
    String language; // eg. eng (enclosed in gco:CharacterString)
  
  	//Enclosed in characterSet  
    String MD_CharacterSetCode_codeList; // eg. ./resources/codeList.xml#MD_CharacterSetCode (attribute)
    String MD_CharacterSetCode_codeListValue; // eg. utf8 (attribute)
    
    //Enclosed in heirarchyLevel
    String MD_ScopeCode_codeList; // eg. ./resources/codeList.xml#MD_ScopeCode (attribute)
    String MD_ScopeCode_codeListValue; // eg. dataset (attribute)
    
    //contact object roughly here
    
    String dateStamp; // eg. 2012-05-14T08:38:15 (enclosed in gco:DateTime)
 
    String metadataStandardName; // eg. ISO 19115:2003/19139 (enclosed in gco:CharacterString)
    String metadataStandardVersion; // eg. 1.0 (enclosed in gco:CharacterString)
    
    
  
  <gmd:distributionInfo>
      <gmd:MD_Distribution>
         <gmd:distributionFormat>
            <gmd:MD_Format>
               <gmd:name gco:nilReason="missing">
                  <gco:CharacterString/>
               </gmd:name>
               <gmd:version gco:nilReason="missing">
                  <gco:CharacterString/>
               </gmd:version>
            </gmd:MD_Format>
         </gmd:distributionFormat>
         <gmd:transferOptions>
            <gmd:MD_DigitalTransferOptions>
               
  <gmd:onLine>
  <gmd:CI_OnlineResource>
     <gmd:linkage>
        <gmd:URL>http://geology.data.vic.gov.au/services/earthresourceml/wfs?&amp;request=GetFeature&amp;service=WFS&amp;typename=er:Mine&amp;outputFormat=text/xml; subtype=gml/3.1.1&amp;version=1.1.0</gmd:URL>
     </gmd:linkage>
     <gmd:protocol>OGC:WFS-1.1.0-http-get-feature</gmd:protocol>
     <gmd:name>
        <gco:CharacterString>er:Mine</gco:CharacterString>
     </gmd:name>
     <gmd:description>
        <gco:CharacterString>GSV EarthResourceML (1.1) Mines
(text/xml; subtype=gml/3.1.1)</gco:CharacterString>
     </gmd:description>
  </gmd:CI_OnlineResource>
    </gmd:onLine>
               
                          
                       
             
              
              </gmd:MD_DigitalTransferOptions>
         </gmd:transferOptions>
      </gmd:MD_Distribution>
  </gmd:distributionInfo>
  
  <gmd:dataQualityInfo>
      <gmd:DQ_DataQuality>
         <gmd:scope>
            <gmd:DQ_Scope>
               <gmd:level>
                  <gmd:MD_ScopeCode codeListValue="dataset" codeList="./resources/codeList.xml#MD_ScopeCode"/>
               </gmd:level>
            </gmd:DQ_Scope>
         </gmd:scope>
         <gmd:lineage>
            <gmd:LI_Lineage>
               <gmd:statement gco:nilReason="missing">
                  <gco:CharacterString/>
               </gmd:statement>
            </gmd:LI_Lineage>
         </gmd:lineage>
      </gmd:DQ_DataQuality>
  </gmd:dataQualityInfo>
    
    
    /*String lang;
    String title;
    String id;
    String isbn;
    Date regDate;
    String publisher;
    int price;
    List<String> authors;
    public Book(){
        authors=new ArrayList<String>();
    }*/
}
