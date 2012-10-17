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
    xmlns:gml="http://www.opengis.net/gml"
    xmlns:srv="http://www.isotc211.org/2005/srv"
    xmlns:tm="http://def.seegrid.csiro.au/isotc211/iso19115/2003/temporalobject">
    
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
                    xmlns:tm="http://def.seegrid.csiro.au/isotc211/iso19115/2003/temporalobject"
                    xmlns:dq="http://def.seegrid.csiro.au/isotc211/iso19115/2003/dataquality#"
                    xmlns:srv="http://www.isotc211.org/2005/srv"
                    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#">
            <xsl:attribute name="xml:base"
                >http://example.org/<xsl:value-of select="gmd:MD_Metadata/gmd:fileIdentifier/gco:CharacterString"/>
            </xsl:attribute>
            
            <owl:Ontology rdf:about="">
                <owl:imports rdf:resource="http://def.seegrid.csiro.au/isotc211/iso19115/2003/metadata"/>
            </owl:Ontology>
            <md:Metadata>
                <xsl:attribute name="rdf:about"
                    >http://example.org/<xsl:value-of select="gmd:MD_Metadata/gmd:fileIdentifier/gco:CharacterString"/>/metadata</xsl:attribute>
            
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
                <!-- Generates null pointer exception... <md:ReferenceSystem>
                    <md:referenceSystemIdentifier>
                        <md:Identifier  rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                                <xsl:value-of select="gmd:MD_Metadata/gmd:referenceSystemInfo/gmd:MD_ReferenceSystem/gmd:referenceSystemIdentifier/gmd:RS_Identifier/gmd:code/gco:CharacterString"/>
                        </md:Identifier>
                    </md:referenceSystemIdentifier>
                </md:ReferenceSystem>-->
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
                
                <xsl:for-each select="gmd:MD_Metadata/gmd:hierarchyLevel">
                    <md:heirarchyLevel>
                        <xsl:attribute name="rdf:resource"
                            >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/Scope/<xsl:value-of select="gmd:MD_ScopeCode/@codeListValue"/>
                        </xsl:attribute>
                    </md:heirarchyLevel>
                </xsl:for-each>
                
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
                    <!-- preferred option -->
                    <xsl:apply-templates select="gmd:MD_DataIdentification" />
                    <!-- some XML uses this form -->
                    <xsl:apply-templates select="srv:SV_ServiceIdentification" />
                </md:identificationInfo>
            </xsl:for-each>
                
            </md:Metadata>
            
        </rdf:RDF>
    </xsl:template>
    
    <!-- template for online resources -->
    <xsl:template match="gmd:onLine">
        <md:online>
            <xsl:apply-templates select="gmd:CI_OnlineResource"/>
        </md:online>
    </xsl:template>
    
    <xsl:template match="gmd:CI_OnlineResource">
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
            <!-- doesn't always appear, use for-each -->
            <xsl:for-each select="gmd:function">
                <ci:function>
                    <xsl:attribute name="rdf:resource"
                        >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/OnlineFunctionCode/<xsl:value-of select="gmd:CI_OnLineFunctionCode/@codeListValue"/>
                    </xsl:attribute>
                </ci:function>
            </xsl:for-each>
        </ci:OnlineResource>
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
            <xsl:for-each select="gmd:contactInfo/gmd:CI_Contact">
            <ci:contactInfo>
                <ci:Contact>
                    <ci:address>
                        <ci:Address>
                            <ci:deliveryPoint rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                                <xsl:value-of select="gmd:address/gmd:CI_Address/gmd:deliveryPoint/gco:CharacterString"/>
                            </ci:deliveryPoint>
                            <skos:prefLabel rdf:datatype="http://www.w3.org/2001/XMLSchema#string"></skos:prefLabel>
                            <ci:city rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                                <xsl:value-of select="gmd:address/gmd:CI_Address/gmd:city/gco:CharacterString"/>
                            </ci:city>
                            <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string"></rdfs:label>
                            <ci:postalCode rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                                <xsl:value-of select="gmd:address/gmd:CI_Address/gmd:postalCode/gco:CharacterString"/>
                            </ci:postalCode>
                            <ci:administrativeArea rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                                <xsl:value-of select="gmd:address/gmd:CI_Address/gmd:administrativeArea/gco:CharacterString"/>
                            </ci:administrativeArea>
                            <ci:country rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                                <xsl:value-of select="gmd:address/gmd:CI_Address/gmd:country/gco:CharacterString"/>
                            </ci:country>
                            <!-- use for-each as not always present -->
                            <xsl:for-each select="gmd:address/gmd:CI_Address/gmd:electronicMailAddress">
                            <ci:electronicMailAddress rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                                <xsl:value-of select="gco:CharacterString"/>
                            </ci:electronicMailAddress>
                            </xsl:for-each>
                        </ci:Address>
                    </ci:address>
                    <skos:prefLabel rdf:datatype="http://www.w3.org/2001/XMLSchema#string"></skos:prefLabel>
                    <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string"></rdfs:label>
                    <ci:phone>
                        <ci:Telephone>
                            <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string"></rdfs:label>
                            <ci:voice rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                                <xsl:value-of select="gmd:phone/gmd:CI_Telephone/gmd:voice/gco:CharacterString"/>
                            </ci:voice>
                            <skos:prefLabel rdf:datatype="http://www.w3.org/2001/XMLSchema#string"></skos:prefLabel>
                            <ci:facsimile rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                                <xsl:value-of select="gmd:phone/gmd:CI_Telephone/gmd:facsimile/gco:CharacterString"/>
                            </ci:facsimile>
                        </ci:Telephone>
                    </ci:phone>
                    
                </ci:Contact>
            </ci:contactInfo>
            </xsl:for-each>
            <skos:prefLabel rdf:datatype="http://www.w3.org/2001/XMLSchema#string"></skos:prefLabel>
            <ci:individualName rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                <xsl:value-of select="gmd:individualName/gco:CharacterString"/>
            </ci:individualName>
            <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string"></rdfs:label>
        </ci:ResponsibleParty>
    </xsl:template>
    
    <!-- template for different DataIdentification section: primary style listed below -->
    <xsl:template match="srv:SV_ServiceIdentification">
        <md:DataIdentification rdf:about="srv:SV_ServiceIdentification">
        
            <xsl:apply-templates select="gmd:pointOfContact"/>
            <xsl:apply-templates select="gmd:status"/>
            <xsl:apply-templates select="gmd:language"/>
            <xsl:apply-templates select="gmd:graphicOverview"/>
            <xsl:apply-templates select="gmd:descriptiveKeywords"/>
            <xsl:apply-templates select="gmd:purpose"/>
            <xsl:apply-templates select="gmd:topicCategory"/>
            <xsl:apply-templates select="gmd:supplementalInformation"/>
            <xsl:apply-templates select="gmd:resourceMaintenance"/>
            <xsl:apply-templates select="gmd:characterSet"/>
            <xsl:apply-templates select="gmd:citation"/>
                
            <xsl:for-each select="srv:extent/gmd:EX_Extent/gmd:geographicElement">
                <md:extent>
                    <ex:Extent>
                        <ex:geographicElement>
                            <xsl:apply-templates select="gmd:EX_GeographicBoundingBox"/>
                        </ex:geographicElement>
                    </ex:Extent>
                </md:extent>
            </xsl:for-each>
            
            <xsl:for-each select="srv:extent/gmd:EX_Extent/gmd:temporalElement">
                <md:extent>
                    <ex:Extent>
                        <md:temporalElement>
                            <ex:TemporalExtent>
                                <md:extent>
                                    <tm:TemporalPeriod>
                                        <xsl:attribute name="rdf:about"
                                            ><xsl:value-of select="gmd:EX_TemporalExtent/gmd:extent/gml:TimePeriod/@gml:id"/></xsl:attribute>
                                        <tm:Begin
                                            ><xsl:value-of select="gmd:EX_TemporalExtent/gmd:extent/gml:TimePeriod/gml:beginPosition"/></tm:Begin>
                                        <tm:End
                                            ><xsl:value-of select="gmd:EX_TemporalExtent/gmd:extent/gml:TimePeriod/gml:endPosition"/></tm:End>
                                    </tm:TemporalPeriod>
                                </md:extent>
                            </ex:TemporalExtent>
                        </md:temporalElement>
                    </ex:Extent>
                </md:extent>
            </xsl:for-each>
            
            <xsl:for-each select="gmd:spatialRepresentationType">        
                <md:spatialRepresentationType>
                        <xsl:attribute name="rdf:resource"
                            >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/SpatialRepresentationType/<xsl:value-of select="gmd:MD_SpatialRepresentationTypeCode/@codeListValue"/></xsl:attribute>
                </md:spatialRepresentationType>
            </xsl:for-each>
            
            <xsl:for-each select="gmd:spatialResolution/gmd:MD_Resolution">
                <md:spatialResolution>
                    <md:RepresentativeFraction>
                        <md:denominator rdf:datatype="http://www.w3.org/2001/XMLSchema#integer"
                            ><xsl:value-of select="gmd:equivalentScale/gmd:MD_RepresentativeFraction/gmd:denominator/gco:Integer"/></md:denominator>
                    </md:RepresentativeFraction>
                </md:spatialResolution>
            </xsl:for-each>
            
            <xsl:apply-templates select="gmd:resourceConstaints"/>
            
            <md:abstract rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
                ><xsl:value-of select="gmd:abstract/gco:CharacterString"/></md:abstract>
        
        <!-- this format does not appear to have an equivalent in the schema provided, have preserved it to be able to recover the data -->    
            <srv:serviceType rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                <xsl:value-of select="srv:serviceType/gco:LocalName"/>
        </srv:serviceType>
            <srv:serviceTypeVersion rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
            <xsl:value-of select="srv:serviceTypeVersion/gco:CharacterString"/>
        </srv:serviceTypeVersion>
        <srv:accessProperties>
            <md:StandardOrderProcess>
                <md:fees rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
                    ><xsl:value-of select="srv:accessProperties/gmd:MD_StandardOrderProcess/gmd:fees/gco:CharacterString"/></md:fees>
            </md:StandardOrderProcess>
        </srv:accessProperties>
        
        <xsl:for-each select="srv:coupledResource">
        <srv:coupledResource>
            <srv:CoupledResource>
                <xsl:attribute name="rdf:about"
                    ><xsl:value-of select="srv:SV_CoupledResource/gco:ScopedName"/>
                </xsl:attribute>
                <srv:operationName rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
                    ><xsl:value-of select="srv:SV_CoupledResource/srv:operationName/gco:CharacterString"/></srv:operationName>
                <srv:identifier rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
                    ><xsl:value-of select="srv:SV_CoupledResource/srv:identifier/gco:CharacterString"/></srv:identifier>
            </srv:CoupledResource>
        </srv:coupledResource>
        </xsl:for-each>
        
        <xsl:for-each select="srv:couplingType">
        <srv:couplingType>
            <srv:CouplingType>
                <xsl:attribute name="rdf:about"
                    ><xsl:value-of select="srv:SV_CouplingType"/></xsl:attribute>
            </srv:CouplingType>
        </srv:couplingType>
        </xsl:for-each>
        
        <xsl:for-each select="srv:containsOperations">
        <srv:containsOperations>
            <srv:SV_OperationMetadata>
                <srv:operationName rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
                    ><xsl:value-of select="srv:SV_OperationMetadata/srv:operationName/gco:CharacterString"/>
                </srv:operationName>
                <xsl:for-each select="srv:SV_OperationMetadata/srv:DCP">
                    <srv:DCP>
                        <xsl:attribute name="rdf:resource"
                            >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/DCPList/<xsl:value-of select="srv:DCPList/@codeListValue"/>
                        </xsl:attribute>
                    </srv:DCP>
                </xsl:for-each>
                <xsl:for-each select="srv:SV_OperationMetadata/srv:connectPoint">
                <srv:connectPoint>
                    <xsl:apply-templates select="gmd:CI_OnlineResource"/>    
                </srv:connectPoint>
                </xsl:for-each>
            </srv:SV_OperationMetadata>
        </srv:containsOperations>
        </xsl:for-each>   
        
        <xsl:for-each select="srv:operatesOn">
            <srv:operatesOn rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
                ><xsl:value-of select="@uuidref"></xsl:value-of>
            </srv:operatesOn>
            
        </xsl:for-each>
        
        </md:DataIdentification>
    </xsl:template>
    
    <!-- template for DataIdentification section -->
    <xsl:template match="gmd:MD_DataIdentification">
        <md:DataIdentification rdf:about="gmd:MD_DataIdentification">
        
            <xsl:apply-templates select="gmd:pointOfContact"/>
            <xsl:apply-templates select="gmd:status"/>
            <xsl:apply-templates select="gmd:language"/>
            <xsl:apply-templates select="gmd:graphicOverview"/>
            <xsl:apply-templates select="gmd:descriptiveKeywords"/>
            <xsl:apply-templates select="gmd:purpose"/>
            <xsl:apply-templates select="gmd:topicCategory"/>
            <xsl:apply-templates select="gmd:supplementalInformation"/>
            <xsl:apply-templates select="gmd:resourceMaintenance"/>
            <xsl:apply-templates select="gmd:characterSet"/>
            <xsl:apply-templates select="gmd:citation"/>
                    
        <xsl:for-each select="gmd:extent/gmd:EX_Extent/gmd:geographicElement">
            <md:extent>
                <ex:Extent>
                    <ex:geographicElement>
                        <xsl:apply-templates select="gmd:EX_GeographicBoundingBox"/>
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
                                <tm:TemporalPeriod>
                                    <xsl:attribute name="rdf:about"
                                        ><xsl:value-of select="gmd:EX_TemporalExtent/gmd:extent/gml:TimePeriod/@gml:id"/></xsl:attribute>
                                    <tm:Begin
                                        ><xsl:value-of select="gmd:EX_TemporalExtent/gmd:extent/gml:TimePeriod/gml:beginPosition"/></tm:Begin>
                                    <tm:End
                                        ><xsl:value-of select="gmd:EX_TemporalExtent/gmd:extent/gml:TimePeriod/gml:endPosition"/></tm:End>
                                </tm:TemporalPeriod>
                            </md:extent>
                        </ex:TemporalExtent>
                    </md:temporalElement>
                </ex:Extent>
            </md:extent>
        </xsl:for-each>
        
        <xsl:for-each select="gmd:spatialRepresentationType">        
        <md:spatialRepresentationType>
                <xsl:attribute name="rdf:resource"
                    >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/SpatialRepresentationType/<xsl:value-of select="gmd:MD_SpatialRepresentationTypeCode/@codeListValue"/></xsl:attribute>
        </md:spatialRepresentationType>
        </xsl:for-each>
        
        <xsl:for-each select="gmd:spatialResolution/gmd:MD_Resolution">
        <md:spatialResolution>
            <md:RepresentativeFraction>
                <md:denominator rdf:datatype="http://www.w3.org/2001/XMLSchema#integer"
                    ><xsl:value-of select="gmd:equivalentScale/gmd:MD_RepresentativeFraction/gmd:denominator/gco:Integer"/></md:denominator>
            </md:RepresentativeFraction>
        </md:spatialResolution>
        </xsl:for-each>
        
        <xsl:apply-templates select="gmd:resourceConstaints"/>
            
        <md:abstract rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
            ><xsl:value-of select="gmd:abstract/gco:CharacterString"/></md:abstract>
        
    </md:DataIdentification>
    </xsl:template>
    
    <!-- templates for elements within the different DataIdentification forms -->
    <xsl:template match="gmd:pointOfContact">
        <md:pointOfContact>
           <!-- Cannot assign this or invalid <xsl:attribute name="rdf:resource"
                >http://www.csiro.au/people/<xsl:value-of select="translate(gmd:CI_ResponsibleParty/gmd:individualName/gco:CharacterString,' ','')"/>
            </xsl:attribute>-->
            <xsl:apply-templates select="gmd:CI_ResponsibleParty" />
        </md:pointOfContact>
    </xsl:template>
    
    <xsl:template match="gmd:citation"> 
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
    </xsl:template>
    
    <xsl:template match="gmd:status">
    <md:status>
        <xsl:attribute name="rdf:resource"
            >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/Progress/<xsl:value-of select="gmd:MD_ProgressCode/@codeListValue"/>
        </xsl:attribute>
    </md:status>
    </xsl:template>
    
    <xsl:template match="gmd:language">
    <md:language rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
        ><xsl:value-of select="gco:CharacterString"/></md:language>
    </xsl:template>
    
    <xsl:template match="gmd:descriptiveKeywords">
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
    </xsl:template>
    
    <xsl:template match="gmd:graphicOverview">
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
    </xsl:template>
    
    <xsl:template match="gmd:purpose">
    <md:purpose rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
        ><xsl:choose>
            <xsl:when test="gco:CharacterString != ''">
                <xsl:value-of select="gco:CharacterString"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="@gco:nilReason"/>
            </xsl:otherwise>
        </xsl:choose></md:purpose>
    </xsl:template>
    
    <xsl:template match="gmd:topicCategory">
    <md:topicCategory>
        <xsl:attribute name="rdf:resource"
            >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/TopicCategory/<xsl:value-of select="gmd:MD_TopicCategoryCode"/>
        </xsl:attribute>
    </md:topicCategory>
    </xsl:template>
    
    <xsl:template match="gmd:supplementalInformation">
    <md:supplementalInformation rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
        ><xsl:choose>
            <xsl:when test="gco:CharacterString != ''">
                <xsl:value-of select="gco:CharacterString"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="@gco:nilReason"/>
            </xsl:otherwise>
        </xsl:choose></md:supplementalInformation>
    </xsl:template>
    
    <xsl:template match="gmd:resourceMaintenance">
    <md:resourceMaintenance>
        <md:MaintenanceInformation>
            <md:maintenanceAndUpdateFrequency>
                <xsl:attribute name="rdf:resource"
                    >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/MaintenanceFrequency/<xsl:value-of select="gmd:MD_MaintenanceInformation/gmd:maintenanceAndUpdateFrequency/gmd:MD_MaintenanceFrequencyCode/@codeListValue"/>                                    
                </xsl:attribute>
            </md:maintenanceAndUpdateFrequency>
        </md:MaintenanceInformation>
    </md:resourceMaintenance>
    </xsl:template>
    
    <xsl:template match="gmd:characterSet">
    <md:characterSet>
        <xsl:attribute name="rdf:resource"
            >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/CharacterSet/<xsl:value-of select="gmd:MD_CharacterSetCode/@codeListValue"/>                                    
        </xsl:attribute>
    </md:characterSet>
    </xsl:template>
    
    <xsl:template match="gmd:EX_GeographicBoundingBox">
        <ex:GeographicBoundingBox>
            <ex:northBoundLatitude rdf:datatype="http://www.w3.org/2001/XMLSchema#decimal"
                ><xsl:value-of select="gmd:northBoundLatitude/gco:Decimal"/></ex:northBoundLatitude>
            <ex:southBoundLatitude rdf:datatype="http://www.w3.org/2001/XMLSchema#decimal"
                ><xsl:value-of select="gmd:southBoundLatitude/gco:Decimal"/></ex:southBoundLatitude>
            <ex:eastBoundLongitude rdf:datatype="http://www.w3.org/2001/XMLSchema#decimal"
                ><xsl:value-of select="gmd:eastBoundLongitude/gco:Decimal"/></ex:eastBoundLongitude>
            <ex:westBoundLongitude rdf:datatype="http://www.w3.org/2001/XMLSchema#decimal"
                ><xsl:value-of select="gmd:westBoundLongitude/gco:Decimal"/></ex:westBoundLongitude>
        </ex:GeographicBoundingBox>
    </xsl:template>
    
    <xsl:template match="gmd:resourceConstaints">
        <md:resourceConstraints>
            <md:LegalConstraints>
                <md:otherConstraints rdf:datatype="http://www.w3.org/2001/XMLSchema#string"
                    ><xsl:choose>
                        <xsl:when test="gmd:MD_LegalConstraints/gmd:otherConstraints/gco:CharacterString != ''">
                            <xsl:value-of select="gmd:MD_LegalConstraints/gmd:otherConstraints/gco:CharacterString"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="gmd:MD_LegalConstraints/gmd:otherConstraints/@gco:nilReason"/>
                        </xsl:otherwise>
                    </xsl:choose></md:otherConstraints>
                <md:accessConstraints>
                    <xsl:attribute name="rdf:resource"
                        >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/Restriction/<xsl:value-of select="gmd:MD_LegalConstraints/gmd:accessConstraints/gmd:MD_RestrictionCode/@codeListValue"/>
                    </xsl:attribute>
                </md:accessConstraints>
                <md:useConstaints>
                    <xsl:attribute name="rdf:resource"
                        >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/Restriction/<xsl:value-of select="gmd:MD_LegalConstraints/gmd:useConstraints/gmd:MD_RestrictionCode/@codeListValue"/></xsl:attribute>
                </md:useConstaints>
            </md:LegalConstraints>
        </md:resourceConstraints>
    </xsl:template>
    
</xsl:stylesheet>