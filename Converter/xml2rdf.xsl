<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:md="http://def.seegrid.csiro.au/isotc211/iso19115/2003/metadata#"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:ci="http://def.seegrid.csiro.au/isotc211/iso19115/2003/citation#"
    xmlns:ex="http://def.seegrid.csiro.au/isotc211/iso19115/2003/extent#"
    xmlns:li="http://def.seegrid.csiro.au/isotc211/iso19115/2003/lineage#"
    xmlns:owl="http://www.w3.org/2002/07/owl#"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
    xmlns:dq="http://def.seegrid.csiro.au/isotc211/iso19115/2003/dataquality#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:gmd="http://www.isotc211.org/2005/gmd"
    xmlns:gco="http://www.isotc211.org/2005/gco"
    xmlns:gml="http://www.opengis.net/gml">
    
    <!-- commandlineParam specify with fileID="190488" for example -->
    <xsl:param name="fileID"/>
    
    <xsl:strip-space elements="*"/>
    <xsl:output method="xml" indent="yes"/>
    
    <!-- Begin RDF document -->
    <xsl:template match="/">
        <rdf:RDF    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                    xmlns:md="http://def.seegrid.csiro.au/isotc211/iso19115/2003/metadata#"
                    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
                    xmlns:ci="http://def.seegrid.csiro.au/isotc211/iso19115/2003/citation#"
                    xmlns:ex="http://def.seegrid.csiro.au/isotc211/iso19115/2003/extent#"
                    xmlns:li="http://def.seegrid.csiro.au/isotc211/iso19115/2003/lineage#"
                    xmlns:owl="http://www.w3.org/2002/07/owl#"
                    xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
                    xmlns:gml="http://www.opengis.net/gml"
                    
                    xmlns:dq="http://def.seegrid.csiro.au/isotc211/iso19115/2003/dataquality#"
                    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#">
             <!--xml:base="http://example.org/p190488">-->
            <xsl:attribute name="xml:base"
                >http://example.org/<xsl:value-of select="$fileID"/>
            </xsl:attribute>
            
            <!--xmlns:p190488="http://example.org/p190488#" -->
            <!-- how to set an attribute name that contains a variable ??? -->
            <!--<xsl:attribute name="xmlns:p{$fileID}"
                >http://example.org/p<xsl:value-of select="$fileID"/>#</xsl:attribute>-->
            
            <owl:Ontology rdf:about="">
                <owl:imports rdf:resource="http://def.seegrid.csiro.au/isotc211/iso19115/2003/metadata"/>
            </owl:Ontology>
            <md:Metadata>
                <xsl:attribute name="rdf:about"
                    >http://example.org/<xsl:value-of select="$fileID"/>/metadata</xsl:attribute>
            
            <!-- Online Resource Links -->
                <xsl:for-each select="gmd:MD_Metadata/gmd:distributionInfo/gmd:MD_Distribution/gmd:transferOptions/gmd:MD_DigitalTransferOptions">
            <md:distributionInfo>
                <md:Distribution>
                    <md:transferOptions>
                        <md:DigitalTransferOptions>
                            <xsl:apply-templates select="gmd:onLine"/>
                        </md:DigitalTransferOptions>
                    </md:transferOptions>
                </md:Distribution>
            </md:distributionInfo>
            </xsl:for-each>
            
            <!-- File data -->
            <md:dateStamp rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">
                <xsl:value-of select="gmd:MD_Metadata/gmd:dateStamp/gco:DateTime"/>
            </md:dateStamp>
            <!-- from example, seems constant... cannot locate differentiating data piece in original XML -->
                <!-- code is given, have attempted to include corrected here -->
            <md:referenceSystemInfo rdf:resource="http://www.opengis.net/def/crs/EPSG/0/4326">
                <md:ReferenceSystem>
                    <md:referenceSystemIdentifier>
                        <md:Identifier>
                            <md:code>
                                <xsl:value-of select="gmd:MD_Metadata/gmd:referenceSystemInfo/gmd:MD_ReferenceSystem/gmd:referenceSystemIdentifier/gmd:RS_Identifier/gmd:code/gco:CharacterString"/>
                            </md:code>
                        </md:Identifier>
                    </md:referenceSystemIdentifier>
                </md:ReferenceSystem>
            </md:referenceSystemInfo> 
            <md:characterSet>
                <xsl:attribute name="rdf:resource"
                    >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/CharacterSet/<xsl:value-of select="gmd:MD_Metadata/gmd:characterSet/gmd:MD_CharacterSetCode/@codeListValue"/>
                </xsl:attribute>
            </md:characterSet>
            <md:fileIdentifier rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                <xsl:value-of select="gmd:MD_Metadata/gmd:fileIdentifier/gco:CharacterString"/>
            </md:fileIdentifier>
            <md:metadataStandardName rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                <xsl:value-of select="gmd:MD_Metadata/gmd:metadataStandardName/gco:CharacterString"/>
            </md:metadataStandardName>
            <md:metadataStandardVersion rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                <xsl:value-of select="gmd:MD_Metadata/gmd:metadataStandardVersion/gco:CharacterString"/>
            </md:metadataStandardVersion>
            
                <xsl:for-each select="gmd:MD_Metadata/gmd:contact">
                    <md:contact>
                        <xsl:apply-templates select="gmd:CI_ResponsibleParty" />
                    </md:contact>
                </xsl:for-each>    

                <xsl:for-each select="gmd:MD_Metadata/gmd:dataQualityInfo/gmd:DQ_DataQuality">
             <md:dataQualityInfo>
                <dq:DataQuality>
                    <dq:lineage>
                        <li:Lineage>
                            <li:statement rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
                                ><xsl:choose>
                                    <xsl:when test="gmd:lineage/gmd:LI_Lineage/gmd:statement/gco:CharacterString != ''">
                                        <xsl:value-of select="gmd:lineage/gmd:LI_Lineage/gmd:statement/gco:CharacterString"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="gmd:lineage/gmd:LI_Lineage/gmd:statement/@gco:nilReason"/>
                                    </xsl:otherwise>
                                </xsl:choose></li:statement>
                        </li:Lineage>
                    </dq:lineage>
                    <dq:scope>
                        <dq:Scope>
                            <dq:level rdf:resource="http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/Scope/service">
                                <xsl:attribute name="rdf:resource"
                                    >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/Scope/<xsl:value-of select="gmd:scope/gmd:DQ_Scope/gmd:level/gmd:MD_ScopeCode/@codeListValue"/>
                                </xsl:attribute>
                            </dq:level>
                        </dq:Scope>
                    </dq:scope>
                </dq:DataQuality>
            </md:dataQualityInfo>
                </xsl:for-each>
            
            <xsl:for-each select="gmd:MD_Metadata/gmd:identificationInfo">
                <md:identificationInfo>
                    <xsl:apply-templates select="gmd:MD_DataIdentification" />
                </md:identificationInfo>
            </xsl:for-each>
                
            </md:Metadata>
            
        </rdf:RDF>
    </xsl:template>
    
    <!-- template for online resources -->
    <xsl:template match="gmd:onLine">
        <md:online>
            <xsl:for-each select="gmd:CI_OnlineResource">
            <ci:OnlineResource>
                <ci:description rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
                ><xsl:value-of select="gmd:description/gco:CharacterString" /></ci:description>
                <ci:name rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
                ><xsl:value-of select="gmd:name/gco:CharacterString" /></ci:name>
                <ci:protocol rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
                ><xsl:value-of select="gmd:protocol/gco:CharacterString" /></ci:protocol>
                <ci:linkage>
                    <rdf:Description>
                            <xsl:attribute name="rdf:about"><xsl:value-of select="gmd:linkage/gmd:URL"/></xsl:attribute>
                        <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
                        ></rdfs:label>
                        <skos:prefLabel rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
                        ></skos:prefLabel>
                    </rdf:Description>
                </ci:linkage>
            </ci:OnlineResource>
            </xsl:for-each>
        </md:online>
    </xsl:template>
    
    <!-- template for each usage of contact entry (pointOfContact, Contact) -->
    <xsl:template match="gmd:CI_ResponsibleParty">
        <ci:ResponsibleParty>
            <xsl:attribute name="rdf:about"
                >http://www.csiro.au/people/<xsl:value-of select="translate(gmd:individualName/gco:CharacterString,' ','')"/>
            </xsl:attribute>
            <ci:positionName rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                <xsl:value-of select="gmd:positionName/gco:CharacterString"/>
            </ci:positionName>
            <ci:role>
                <xsl:attribute name="rdf:resource"
                    >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/Role/<xsl:value-of select="gmd:CI_ResponsibleParty/gmd:role/gmd:CI_RoleCode/@codeListValue"/>
                </xsl:attribute>
            </ci:role>
            <ci:organisationName rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                <xsl:value-of select="gmd:organisationName/gco:CharacterString"/>
            </ci:organisationName>
            <ci:contactInfo>
                <ci:Contact>
                    <ci:address>
                        <ci:Address>
                            <ci:deliveryPoint rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                                <xsl:value-of select="gmd:contactInfo/gmd:CI_Contact/gmd:address/gmd:CI_Address/gmd:deliveryPoint/gco:CharacterString"/>
                            </ci:deliveryPoint>
                            <skos:prefLabel rdf:datatype="http://www.w3.org/2001/XMLSchema#string"></skos:prefLabel>
                            <ci:city rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                                <xsl:value-of select="gmd:contactInfo/gmd:CI_Contact/gmd:address/gmd:CI_Address/gmd:city/gco:CharacterString"/>
                            </ci:city>
                            <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string"></rdfs:label>
                            <ci:postalCode rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                                <xsl:value-of select="gmd:contactInfo/gmd:CI_Contact/gmd:address/gmd:CI_Address/gmd:postalCode/gco:CharacterString"/>
                            </ci:postalCode>
                            <ci:administrativeArea rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                                <xsl:value-of select="gmd:contactInfo/gmd:CI_Contact/gmd:address/gmd:CI_Address/gmd:administrativeArea/gco:CharacterString"/>
                            </ci:administrativeArea>
                            <ci:country rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                                <xsl:value-of select="gmd:contactInfo/gmd:CI_Contact/gmd:address/gmd:CI_Address/gmd:country/gco:CharacterString"/>
                            </ci:country>
                            <ci:electronicMailAddress rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                                <xsl:value-of select="gmd:contactInfo/gmd:CI_Contact/gmd:address/gmd:CI_Address/gmd:electronicMailAddress/gco:CharacterString"/>
                            </ci:electronicMailAddress>
                        </ci:Address>
                    </ci:address>
                    <skos:prefLabel rdf:datatype="http://www.w3.org/2001/XMLSchema#string"></skos:prefLabel>
                    <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string"></rdfs:label>
                    <ci:phone>
                        <ci:Telephone>
                            <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string"></rdfs:label>
                            <ci:voice rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                                <xsl:value-of select="gmd:contactInfo/gmd:CI_Contact/gmd:phone/gmd:CI_Telephone/gmd:voice/gco:CharacterString"/>
                            </ci:voice>
                            <skos:prefLabel rdf:datatype="http://www.w3.org/2001/XMLSchema#string"></skos:prefLabel>
                            <ci:facsimile rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                                <xsl:value-of select="gmd:contactInfo/gmd:CI_Contact/gmd:phone/gmd:CI_Telephone/gmd:facsimile/gco:CharacterString"/>
                            </ci:facsimile>
                        </ci:Telephone>
                    </ci:phone>
                    
                </ci:Contact>
            </ci:contactInfo>
            <skos:prefLabel rdf:datatype="http://www.w3.org/2001/XMLSchema#string"></skos:prefLabel>
            <ci:individualName rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                <xsl:value-of select="gmd:individualName/gco:CharacterString"/>
            </ci:individualName>
            <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string"></rdfs:label>
        </ci:ResponsibleParty>
    </xsl:template>
    
    <!-- template for DataIdentification section -->
    <xsl:template match="gmd:MD_DataIdentification">
    <md:DataIdentification>
        
        <xsl:for-each select="gmd:pointOfContact">
            <md:pointOfContact>
                <xsl:attribute name="rdf:resource"
                    >http://www.csiro.au/people/<xsl:value-of select="translate(gmd:CI_ResponsibleParty/gmd:individualName/gco:CharacterString,' ','')"/>
                </xsl:attribute>
                <xsl:apply-templates select="gmd:CI_ResponsibleParty" />
            </md:pointOfContact>
        </xsl:for-each>
        
        <md:status>
            <xsl:attribute name="rdf:resource"
                >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/Progress/<xsl:value-of select="gmd:status/gmd:MD_ProgressCode/@codeListValue"/>
            </xsl:attribute>
        </md:status>
        <md:language rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
            ><xsl:value-of select="gmd:language/gco:CharacterString"/></md:language>
        
        <xsl:for-each select="gmd:graphicOverview">
            <md:graphicOverview>
                <md:BrowseGraphic>
                    <md:fileName rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
                        ><xsl:choose>
                            <xsl:when test="gmd:MD_BrowseGraphic/gmd:fileName/gco:CharacterString != ''">
                                <xsl:value-of select="gmd:MD_BrowseGraphic/gmd:fileName/gco:CharacterString"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="gmd:MD_BrowseGraphic/gmd:fileName/@gco:nilReason"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </md:fileName>
                    <md:fileDescription rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
                        ><xsl:value-of select="gmd:MD_BrowseGraphic/gmd:fileDescription/gco:CharacterString"/>
                    </md:fileDescription>
                </md:BrowseGraphic>
            </md:graphicOverview>
        </xsl:for-each>
        
        <xsl:for-each select="gmd:descriptiveKeywords">
            <md:descriptiveKeywords>
                <md:Keywords>
                    <md:type>
                        <xsl:attribute name="rdf:resource"
                            >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/KeywordType/<xsl:value-of select="gmd:MD_Keywords/gmd:type/gmd:MD_KeywordTypeCode/@codeListValue"/>
                        </xsl:attribute>
                    </md:type>
                    <md:keyword rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
                        ><xsl:value-of select="gmd:MD_Keywords/gmd:keyword/gco:CharacterString"/></md:keyword>
                </md:Keywords>
            </md:descriptiveKeywords>
        </xsl:for-each>
        
        <md:purpose rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
            ><xsl:choose>
                <xsl:when test="gmd:purpose/gco:CharacterString != ''">
                    <xsl:value-of select="gmd:purpose/gco:CharacterString"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="gmd:purpose/@gco:nilReason"/>
                </xsl:otherwise>
            </xsl:choose></md:purpose>
        
        <md:topicCategory>
            <xsl:attribute name="rdf:resource"
                >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/TopicCategory/<xsl:value-of select="gmd:topicCategory/gmd:MD_TopicCategoryCode"/>
            </xsl:attribute>
        </md:topicCategory>
        
        <md:supplementalInformation rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
            ><xsl:choose>
                <xsl:when test="gmd:supplementalInformation/gco:CharacterString != ''">
                    <xsl:value-of select="gmd:supplementalInformation/gco:CharacterString"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="gmd:supplementalInformation/@gco:nilReason"/>
                </xsl:otherwise>
            </xsl:choose></md:supplementalInformation>
        
        <md:resourceMaintenance>
            <md:MaintenanceInformation>
                <md:maintenanceAndUpdateFrequency>
                    <xsl:attribute name="rdf:resource"
                        >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/MaintenanceFrequency/<xsl:value-of select="gmd:resourceMaintenance/gmd:MD_MaintenanceInformation/gmd:maintenanceAndUpdateFrequency/gmd:MD_MaintenanceFrequencyCode/@codeListValue"/>                                    
                    </xsl:attribute>
                </md:maintenanceAndUpdateFrequency>
            </md:MaintenanceInformation>
        </md:resourceMaintenance>
        
        <md:characterSet rdf:resource="http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/CharacterSet/utf8">
            <xsl:attribute name="rdf:resource"
                >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/CharacterSet/<xsl:value-of select="gmd:characterSet/gmd:MD_CharacterSetCode/@codeListValue"/>                                    
            </xsl:attribute>
        </md:characterSet>
        
        <xsl:for-each select="gmd:citation"> 
            <md:citation>
                <ci:Citation>
                    <ci:presentationForm>
                        <xsl:attribute name="rdf:resource"
                            >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/PresentationForm/<xsl:value-of select="gmd:CI_Citation/gmd:presentationForm/gmd:CI_PresentationFormCode/@codeListValue"/>
                        </xsl:attribute>
                    </ci:presentationForm>
                    <ci:edition rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
                        ><xsl:value-of select="gmd:CI_Citation/gmd:edition/gco:CharacterString"/></ci:edition>
                    <ci:date>
                        <ci:Date>
                            <ci:dateType>
                                <xsl:attribute name="rdf:resource"
                                    >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/DateType/<xsl:value-of select="gmd:CI_Citation/gmd:date/gmd:CI_Date/gmd:dateType/gmd:CI_DateTypeCode/@codeListValue"/>
                                </xsl:attribute>
                            </ci:dateType>
                            <ci:Date.date rdf:datatype="http://www.w3.org/2001/XMLSchema#date"
                                ><xsl:value-of select="gmd:CI_Citation/gmd:date/gmd:CI_Date/gmd:date/gco:DateTime"/></ci:Date.date>
                        </ci:Date>
                    </ci:date>
                    <ci:title rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
                        ><xsl:value-of select="gmd:CI_Citation/gmd:title/gco:CharacterString"/></ci:title>
                </ci:Citation>
            </md:citation>
        </xsl:for-each>
        
        <xsl:for-each select="gmd:extent/gmd:EX_Extent/gmd:geographicElement">
            <md:extent>
                <ex:Extent>
                    <ex:geographicElement>
                        <ex:GeographicBoundingBox>
                            <ex:northBoundLatitude rdf:datatype="http://www.w3.org/2001/XMLSchema#decimal"
                                ><xsl:value-of select="gmd:EX_GeographicBoundingBox/gmd:northBoundLatitude/gco:Decimal"/></ex:northBoundLatitude>
                            <ex:southBoundLatitude rdf:datatype="http://www.w3.org/2001/XMLSchema#decimal"
                                ><xsl:value-of select="gmd:EX_GeographicBoundingBox/gmd:southBoundLatitude/gco:Decimal"/></ex:southBoundLatitude>
                            <ex:eastBoundLongitude rdf:datatype="http://www.w3.org/2001/XMLSchema#decimal"
                                ><xsl:value-of select="gmd:EX_GeographicBoundingBox/gmd:eastBoundLongitude/gco:Decimal"/></ex:eastBoundLongitude>
                            <ex:westBoundLongitude rdf:datatype="http://www.w3.org/2001/XMLSchema#decimal"
                                ><xsl:value-of select="gmd:EX_GeographicBoundingBox/gmd:westBoundLongitude/gco:Decimal"/></ex:westBoundLongitude>
                        </ex:GeographicBoundingBox>
                    </ex:geographicElement>
                </ex:Extent>
            </md:extent>
        </xsl:for-each>
        
        <xsl:for-each select="gmd:extent/gmd:EX_Extent/gmd:temporalElement">
            <md:extent>
                <ex:Extent>
                    <md:temporalElement>
                        <ex:TemporalExtent>
                            <md:extent>
                                <!-- need some advice on the validity of GML in RDF... -->
                            </md:extent>
                        </ex:TemporalExtent>
                    </md:temporalElement>
                </ex:Extent>
            </md:extent>
        </xsl:for-each>
                
        <md:spatialRepresentationType>
            <md:SpatialRepresentationTypeCode>
                <xsl:attribute name="rdf:resource"
                    >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/SpatialRepresentationType/<xsl:value-of select="gmd:SpatialRepresentationType/gmd:MD_SpatialRepresentationTypeCode/@codeListValue"/></xsl:attribute>
            </md:SpatialRepresentationTypeCode>
        </md:spatialRepresentationType>
        
        <md:spatialResolution>
            <md:RepresentativeFraction>
                <md:denominator rdf:datatype="http://www.w3.org/2001/XMLSchema#integer"
                    ><xsl:value-of select="gmd:spatialResolution/gmd:MD_Resolution/gmd:equivalentScale/gmd:MD_RepresentativeFraction/gmd:denominator/gco:Integer"/></md:denominator>
            </md:RepresentativeFraction>
        </md:spatialResolution>
        
        <md:resourceConstraints>
            <md:LegalConstraints>
                <md:otherConstraints rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
                    ><xsl:choose>
                        <xsl:when test="gmd:resourceConstraints/gmd:MD_LegalConstraints/gmd:otherConstraints/gco:CharacterString != ''">
                            <xsl:value-of select="gmd:resourceConstraints/gmd:MD_LegalConstraints/gmd:otherConstraints/gco:CharacterString"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="gmd:resourceConstraints/gmd:MD_LegalConstraints/gmd:otherConstraints/@gco:nilReason"/>
                        </xsl:otherwise>
                    </xsl:choose></md:otherConstraints>
                <md:accessConstraints>
                    <xsl:attribute name="rdf:resource"
                        >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/Restriction/<xsl:value-of select="gmd:resourceConstraints/gmd:MD_LegalConstraints/gmd:accessConstraints/gmd:MD_RestrictionCode/@codeListValue"/>
                    </xsl:attribute>
                </md:accessConstraints>
                <md:useConstaints>
                    <xsl:attribute name="rdf:resource"
                        >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/Restriction/<xsl:value-of select="gmd:resourceConstraints/gmd:MD_LegalConstraints/gmd:useConstraints/gmd:MD_RestrictionCode/@codeListValue"/></xsl:attribute>
                </md:useConstaints>
            </md:LegalConstraints>
        </md:resourceConstraints>
        
        <md:abstract rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
            ><xsl:value-of select="gmd:abstract/gco:CharacterString"/></md:abstract>
        
    </md:DataIdentification>
    </rdf:RDF>
    </xsl:template>
</xsl:stylesheet>