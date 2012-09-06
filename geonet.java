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
    
    
  
  <gmd:identificationInfo>
      <gmd:MD_DataIdentification>
         <gmd:citation xmlns:wms="http://www.opengis.net/wms" xmlns:srv="http://www.isotc211.org/2005/srv">
            <gmd:CI_Citation>
               <gmd:title>
                  <gco:CharacterString>GSV EarthResourceML (1.1) Mines</gco:CharacterString>
               </gmd:title>
               <gmd:date>
                  <gmd:CI_Date>
                     <gmd:date>
                        <gco:DateTime>2012-05-14T08:38:15</gco:DateTime>
                     </gmd:date>
                     <gmd:dateType>
                        <gmd:CI_DateTypeCode codeList="./resources/codeList.xml#CI_DateTypeCode" codeListValue="revision"/>
                     </gmd:dateType>
                  </gmd:CI_Date>
               </gmd:date>
            </gmd:CI_Citation>
         </gmd:citation>
         <gmd:abstract xmlns:wms="http://www.opengis.net/wms" xmlns:srv="http://www.isotc211.org/2005/srv">
            <gco:CharacterString>Mines of Victoria provided by GeoScience Victoria (GSV) from the VicMine database. Data presented using the EarthResourceML (version 1.1) data model.</gco:CharacterString>
         </gmd:abstract>
         <gmd:status xmlns:wms="http://www.opengis.net/wms" xmlns:srv="http://www.isotc211.org/2005/srv">
            <gmd:MD_ProgressCode codeList="./resources/codeList.xml#MD_ProgressCode" codeListValue="completed"/>
         </gmd:status>
         <gmd:descriptiveKeywords xmlns:wms="http://www.opengis.net/wms" xmlns:srv="http://www.isotc211.org/2005/srv">
            <gmd:MD_Keywords>
               <gmd:type>
                  <gmd:MD_KeywordTypeCode codeList="./resources/codeList.xml#MD_KeywordTypeCode" codeListValue="theme"/>
               </gmd:type>
            </gmd:MD_Keywords>
         </gmd:descriptiveKeywords>
         <gmd:resourceConstraints xmlns:wms="http://www.opengis.net/wms" xmlns:srv="http://www.isotc211.org/2005/srv">
            <gmd:MD_LegalConstraints>
               <gmd:accessConstraints>
                  <gco:CharacterString>Copyright © The State of Victoria, 2002 - 2011</gco:CharacterString>
               </gmd:accessConstraints>
            </gmd:MD_LegalConstraints>
         </gmd:resourceConstraints>
         <gmd:spatialRepresentationType xmlns:wms="http://www.opengis.net/wms" xmlns:srv="http://www.isotc211.org/2005/srv">
            <gmd:MD_SpatialRepresentationTypeCode codeList="./resources/codeList.xml#MD_SpatialRepresentationTypeCode"
                                                  codeListValue="vector"/>
         </gmd:spatialRepresentationType>
         <gmd:language xmlns:wms="http://www.opengis.net/wms" xmlns:srv="http://www.isotc211.org/2005/srv"
                       gco:nilReason="missing">
            <gco:CharacterString/>
         </gmd:language>
         <gmd:characterSet xmlns:wms="http://www.opengis.net/wms" xmlns:srv="http://www.isotc211.org/2005/srv">
            <gmd:MD_CharacterSetCode codeList="http://www.isotc211.org/2005/resources/codeList.xml#MD_CharacterSetCode"
                                     codeListValue=""/>
         </gmd:characterSet>
         <gmd:topicCategory xmlns:wms="http://www.opengis.net/wms" xmlns:srv="http://www.isotc211.org/2005/srv">
            <gmd:MD_TopicCategoryCode>geoscientificInformation</gmd:MD_TopicCategoryCode>
         </gmd:topicCategory>
         <gmd:extent xmlns:wms="http://www.opengis.net/wms" xmlns:srv="http://www.isotc211.org/2005/srv">
            <gmd:EX_Extent>
               <gmd:geographicElement>
                  <gmd:EX_GeographicBoundingBox>
                     <gmd:westBoundLongitude>
                        <gco:Decimal>
                           <gmd:xmin>140.0</gmd:xmin>
                        </gco:Decimal>
                     </gmd:westBoundLongitude>
                     <gmd:eastBoundLongitude>
                        <gco:Decimal>150.0</gco:Decimal>
                     </gmd:eastBoundLongitude>
                     <gmd:southBoundLatitude>
                        <gco:Decimal>-40.0</gco:Decimal>
                     </gmd:southBoundLatitude>
                     <gmd:northBoundLatitude>
                        <gco:Decimal>-33.0</gco:Decimal>
                     </gmd:northBoundLatitude>
                  </gmd:EX_GeographicBoundingBox>
               </gmd:geographicElement>
            </gmd:EX_Extent>
         </gmd:extent>
      </gmd:MD_DataIdentification>
  </gmd:identificationInfo>
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
                        <gmd:URL>http://geology.data.vic.gov.au/services/earthresourceml/wfs</gmd:URL>
                     </gmd:linkage>
                     <gmd:protocol>
                        <gco:CharacterString>OGC:WFS-1.1.0-http-get-feature</gco:CharacterString>
                     </gmd:protocol>
                     <gmd:name>
                        <gco:CharacterString>er:Mine</gco:CharacterString>
                     </gmd:name>
                     <gmd:description>
                        <gco:CharacterString>GSV EarthResourceML (1.1) Mines</gco:CharacterString>
                     </gmd:description>
                  </gmd:CI_OnlineResource>
               </gmd:onLine>
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
               <gmd:onLine>
                  <gmd:CI_OnlineResource>
                     <gmd:linkage>
                        <gmd:URL>http://geology.data.vic.gov.au/services/earthresourceml/wfs?&amp;request=GetFeature&amp;service=WFS&amp;typename=er:Mine&amp;outputFormat=GML2&amp;version=1.1.0</gmd:URL>
                     </gmd:linkage>
                     <gmd:protocol>OGC:WFS-1.1.0-http-get-feature</gmd:protocol>
                     <gmd:name>
                        <gco:CharacterString>er:Mine</gco:CharacterString>
                     </gmd:name>
                     <gmd:description>
                        <gco:CharacterString>GSV EarthResourceML (1.1) Mines
				(GML2)</gco:CharacterString>
                     </gmd:description>
                  </gmd:CI_OnlineResource>
               </gmd:onLine>
               <gmd:onLine>
                  <gmd:CI_OnlineResource>
                     <gmd:linkage>
                        <gmd:URL>http://geology.data.vic.gov.au/services/earthresourceml/wfs?&amp;request=GetFeature&amp;service=WFS&amp;typename=er:Mine&amp;outputFormat=GML2-GZIP&amp;version=1.1.0</gmd:URL>
                     </gmd:linkage>
                     <gmd:protocol>OGC:WFS-1.1.0-http-get-feature</gmd:protocol>
                     <gmd:name>
                        <gco:CharacterString>er:Mine</gco:CharacterString>
                     </gmd:name>
                     <gmd:description>
                        <gco:CharacterString>GSV EarthResourceML (1.1) Mines
				(GML2-GZIP)</gco:CharacterString>
                     </gmd:description>
                  </gmd:CI_OnlineResource>
               </gmd:onLine>
               <gmd:onLine>
                  <gmd:CI_OnlineResource>
                     <gmd:linkage>
                        <gmd:URL>http://geology.data.vic.gov.au/services/earthresourceml/wfs?&amp;request=GetFeature&amp;service=WFS&amp;typename=er:Mine&amp;outputFormat=SHAPE-ZIP&amp;version=1.1.0</gmd:URL>
                     </gmd:linkage>
                     <gmd:protocol>OGC:WFS-1.1.0-http-get-feature</gmd:protocol>
                     <gmd:name>
                        <gco:CharacterString>er:Mine</gco:CharacterString>
                     </gmd:name>
                     <gmd:description>
                        <gco:CharacterString>GSV EarthResourceML (1.1) Mines
				(SHAPE-ZIP)</gco:CharacterString>
                     </gmd:description>
                  </gmd:CI_OnlineResource>
               </gmd:onLine>
               <gmd:onLine>
                  <gmd:CI_OnlineResource>
                     <gmd:linkage>
                        <gmd:URL>http://geology.data.vic.gov.au/services/earthresourceml/wfs?&amp;request=GetFeature&amp;service=WFS&amp;typename=er:Mine&amp;outputFormat=csv&amp;version=1.1.0</gmd:URL>
                     </gmd:linkage>
                     <gmd:protocol>OGC:WFS-1.1.0-http-get-feature</gmd:protocol>
                     <gmd:name>
                        <gco:CharacterString>er:Mine</gco:CharacterString>
                     </gmd:name>
                     <gmd:description>
                        <gco:CharacterString>GSV EarthResourceML (1.1) Mines
				(csv)</gco:CharacterString>
                     </gmd:description>
                  </gmd:CI_OnlineResource>
               </gmd:onLine>
               <gmd:onLine>
                  <gmd:CI_OnlineResource>
                     <gmd:linkage>
                        <gmd:URL>http://geology.data.vic.gov.au/services/earthresourceml/wfs?&amp;request=GetFeature&amp;service=WFS&amp;typename=er:Mine&amp;outputFormat=gml3&amp;version=1.1.0</gmd:URL>
                     </gmd:linkage>
                     <gmd:protocol>OGC:WFS-1.1.0-http-get-feature</gmd:protocol>
                     <gmd:name>
                        <gco:CharacterString>er:Mine</gco:CharacterString>
                     </gmd:name>
                     <gmd:description>
                        <gco:CharacterString>GSV EarthResourceML (1.1) Mines
				(gml3)</gco:CharacterString>
                     </gmd:description>
                  </gmd:CI_OnlineResource>
               </gmd:onLine>
               <gmd:onLine>
                  <gmd:CI_OnlineResource>
                     <gmd:linkage>
                        <gmd:URL>http://geology.data.vic.gov.au/services/earthresourceml/wfs?&amp;request=GetFeature&amp;service=WFS&amp;typename=er:Mine&amp;outputFormat=gml32&amp;version=1.1.0</gmd:URL>
                     </gmd:linkage>
                     <gmd:protocol>OGC:WFS-1.1.0-http-get-feature</gmd:protocol>
                     <gmd:name>
                        <gco:CharacterString>er:Mine</gco:CharacterString>
                     </gmd:name>
                     <gmd:description>
                        <gco:CharacterString>GSV EarthResourceML (1.1) Mines
				(gml32)</gco:CharacterString>
                     </gmd:description>
                  </gmd:CI_OnlineResource>
               </gmd:onLine>
               <gmd:onLine>
                  <gmd:CI_OnlineResource>
                     <gmd:linkage>
                        <gmd:URL>http://geology.data.vic.gov.au/services/earthresourceml/wfs?&amp;request=GetFeature&amp;service=WFS&amp;typename=er:Mine&amp;outputFormat=json&amp;version=1.1.0</gmd:URL>
                     </gmd:linkage>
                     <gmd:protocol>OGC:WFS-1.1.0-http-get-feature</gmd:protocol>
                     <gmd:name>
                        <gco:CharacterString>er:Mine</gco:CharacterString>
                     </gmd:name>
                     <gmd:description>
                        <gco:CharacterString>GSV EarthResourceML (1.1) Mines
				(json)</gco:CharacterString>
                     </gmd:description>
                  </gmd:CI_OnlineResource>
               </gmd:onLine>
               <gmd:onLine>
                  <gmd:CI_OnlineResource>
                     <gmd:linkage>
                        <gmd:URL>http://geology.data.vic.gov.au/services/earthresourceml/wfs?&amp;request=GetFeature&amp;service=WFS&amp;typename=er:Mine&amp;outputFormat=text/xml; subtype=gml/2.1.2&amp;version=1.1.0</gmd:URL>
                     </gmd:linkage>
                     <gmd:protocol>OGC:WFS-1.1.0-http-get-feature</gmd:protocol>
                     <gmd:name>
                        <gco:CharacterString>er:Mine</gco:CharacterString>
                     </gmd:name>
                     <gmd:description>
                        <gco:CharacterString>GSV EarthResourceML (1.1) Mines
				(text/xml; subtype=gml/2.1.2)</gco:CharacterString>
                     </gmd:description>
                  </gmd:CI_OnlineResource>
               </gmd:onLine>
               <gmd:onLine>
                  <gmd:CI_OnlineResource>
                     <gmd:linkage>
                        <gmd:URL>http://geology.data.vic.gov.au/services/earthresourceml/wfs?&amp;request=GetFeature&amp;service=WFS&amp;typename=er:Mine&amp;outputFormat=text/xml; subtype=gml/3.2&amp;version=1.1.0</gmd:URL>
                     </gmd:linkage>
                     <gmd:protocol>OGC:WFS-1.1.0-http-get-feature</gmd:protocol>
                     <gmd:name>
                        <gco:CharacterString>er:Mine</gco:CharacterString>
                     </gmd:name>
                     <gmd:description>
                        <gco:CharacterString>GSV EarthResourceML (1.1) Mines
				(text/xml; subtype=gml/3.2)</gco:CharacterString>
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
    
    
    String lang;
    String title;
    String id;
    String isbn;
    Date regDate;
    String publisher;
    int price;
    List<String> authors;
    public Book(){
        authors=new ArrayList<String>();
    }
}
