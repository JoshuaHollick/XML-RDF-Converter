<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:md="http://def.seegrid.csiro.au/isotc211/iso19115/2003/metadata#"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:ci="http://def.seegrid.csiro.au/isotc211/iso19115/2003/citation#"
    xmlns:ex="http://def.seegrid.csiro.au/isotc211/iso19115/2003/extent#"
    xmlns:li="http://def.seegrid.csiro.au/isotc211/iso19115/2003/lineage#"
    xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
    xmlns:dq="http://def.seegrid.csiro.au/isotc211/iso19115/2003/dataquality#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:gmd="http://www.isotc211.org/2005/gmd"
    xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gml="http://www.opengis.net/gml"
    xmlns:tm="http://def.seegrid.csiro.au/isotc211/iso19115/2003/temporalobject"
    xmlns:srv="http://www.isotc211.org/2005/srv">

    <!-- commandlineParam specify with fileID="190488" for example -->
    <xsl:param name="fileID"/>

    <xsl:strip-space elements="*"/>
    <xsl:output method="xml" indent="yes"/>

    <!-- Begin XML document -->
    <xsl:template match="/">
        <gmd:MD_Metadata xmlns:gmd="http://www.isotc211.org/2005/gmd"
            xmlns:gts="http://www.isotc211.org/2005/gts" 
            xmlns:gml="http://www.opengis.net/gml"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:gco="http://www.isotc211.org/2005/gco"
            xmlns:geonet="http://www.fao.org/geonetwork"
            xsi:schemaLocation="http://www.isotc211.org/2005/gmd http://www.isotc211.org/2005/gmd/gmd.xsd">
            
            <xsl:attribute name="xml:base"
                >http://example.org/<xsl:value-of select="rdf:RDF/md:Metadata/md:fileIdentifier"/>
            </xsl:attribute>

            <gmd:fileIdentifier xmlns:gmx="http://www.isotc211.org/2005/gmx"
                xmlns:srv="http://www.isotc211.org/2005/srv">
                <gco:CharacterString>
                    <xsl:value-of select="rdf:RDF/md:Metadata/md:fileIdentifier"/>
                </gco:CharacterString>
            </gmd:fileIdentifier>
            <gmd:language>
                <gco:CharacterString>
                    <xsl:value-of select="rdf:RDF/md:Metadata/md:language"/>
                </gco:CharacterString>
            </gmd:language>
            <gmd:characterSet>
                <gmd:MD_CharacterSetCode>
                    <xsl:variable name="code">
                        <xsl:value-of select="rdf:RDF/md:Metadata/md:characterSet/@rdf:resource"/>
                    </xsl:variable>
                    <xsl:attribute name="codeListValue">
                        <xsl:value-of select="substring-after($code, 'CharacterSet/')"/>
                    </xsl:attribute>
                    <xsl:attribute name="codeList"
                        >http://www.isotc211.org/2005/resources/codeList.xml#MD_CharacterSetCode</xsl:attribute>
                </gmd:MD_CharacterSetCode>
            </gmd:characterSet>

            <xsl:for-each select="rdf:RDF/md:Metadata/md:contact">
                <gmd:contact>
                    <xsl:apply-templates select="ci:ResponsibleParty"/>
                </gmd:contact>
            </xsl:for-each>

            <gmd:dateStamp>
                <gco:DateTime xmlns:gmx="http://www.isotc211.org/2005/gmx"
                    xmlns:srv="http://www.isotc211.org/2005/srv">
                    <xsl:value-of select="rdf:RDF/md:Metadata/md:dateStamp"/>
                </gco:DateTime>
            </gmd:dateStamp>
            <gmd:metadataStandardName>
                <gco:CharacterString xmlns:srv="http://www.isotc211.org/2005/srv"
                    xmlns:gmx="http://www.isotc211.org/2005/gmx">
                    <xsl:value-of select="rdf:RDF/md:Metadata/md:metadataStandardName"/>
                </gco:CharacterString>
            </gmd:metadataStandardName>
            <gmd:metadataStandardVersion>
                <gco:CharacterString xmlns:srv="http://www.isotc211.org/2005/srv"
                    xmlns:gmx="http://www.isotc211.org/2005/gmx">
                    <xsl:value-of select="rdf:RDF/md:Metadata/md:metadataStandardVersion"/>
                </gco:CharacterString>
            </gmd:metadataStandardVersion>
            <xsl:for-each select="rdf:RDF/md:Metadata/md:hierarchyLevel">
               <gmd:MD_ScopeCode>
                   <xsl:variable name="code">
                       <xsl:value-of select="rdf:RDF/md:Metadata/md:hierarchyLevel/@rdf:resource"/>
                   </xsl:variable>
                   <xsl:attribute name="codeListValue">
                       <xsl:value-of select="substring-after($code, 'Scope/')"/>
                   </xsl:attribute>
                   <xsl:attribute name="codeList"
                       >http://www.isotc211.org/2005/resources/codeList.xml#MD_ScopeCode</xsl:attribute>
               </gmd:MD_ScopeCode> 
            </xsl:for-each>
            
            <xsl:for-each select="rdf:RDF/md:Metadata/md:referenceSystemInfo">
                <gmd:referenceSystemInfo>
                    <gmd:MD_ReferenceSystem>
                        <gmd:referenceSystemIdentifier>
                            <gmd:RS_Identifier>
                                <gmd:code>
                                    <gco:CharacterString>
                                        <xsl:value-of select="@rdf:resource"/>
                                    </gco:CharacterString>
                                </gmd:code>
                            </gmd:RS_Identifier>
                        </gmd:referenceSystemIdentifier>
                    </gmd:MD_ReferenceSystem>
                </gmd:referenceSystemInfo>
            </xsl:for-each>

            <xsl:for-each select="rdf:RDF/md:Metadata/md:identificationInfo">
                <gmd:identificationInfo>
                    <xsl:apply-templates select="md:DataIdentification"/>
                </gmd:identificationInfo>
            </xsl:for-each>

            <xsl:for-each select="rdf:RDF/md:Metadata/md:distributionInfo">
                <gmd:distributionInfo>
                    <xsl:apply-templates select="md:Distribution"/>
                </gmd:distributionInfo>
            </xsl:for-each>

            <xsl:for-each select="rdf:RDF/md:Metadata/md:dataQualityInfo">
            <gmd:dataQualityInfo>
                <xsl:apply-templates select="dq:DataQuality"/>
            </gmd:dataQualityInfo>
            </xsl:for-each>

        </gmd:MD_Metadata>
    </xsl:template>

    <!-- Contact -->
    <xsl:template match="ci:ResponsibleParty">
        <gmd:CI_ResponsibleParty>
            <gmd:individualName>
                <gco:CharacterString>
                    <xsl:value-of select="ci:individualName"/>
                </gco:CharacterString>
            </gmd:individualName>
            <gmd:organisationName>
                <gco:CharacterString>
                    <xsl:value-of select="ci:organisationName"/>
                </gco:CharacterString>
            </gmd:organisationName>
            <gmd:positionName>
                <gco:CharacterString>
                    <xsl:value-of select="ci:positionName"/>
                </gco:CharacterString>
            </gmd:positionName>
            <gmd:contactInfo>
                <gmd:CI_Contact>
                    <gmd:phone>
                        <gmd:CI_Telephone>
                            <gmd:voice>
                                <gco:CharacterString>
                                    <xsl:value-of select="ci:contactInfo/ci:Contact/ci:phone/ci:Telephone/ci:voice"/>
                                </gco:CharacterString>
                            </gmd:voice>
                            <gmd:facsimile>
                                <gco:CharacterString>
                                    <xsl:value-of select="ci:contactInfo/ci:Contact/ci:phone/ci:Telephone/ci:facsimile"/>
                                </gco:CharacterString>
                            </gmd:facsimile>
                        </gmd:CI_Telephone>
                    </gmd:phone>
                    <gmd:address>
                        <gmd:CI_Address>
                            <gmd:deliveryPoint>
                                <gco:CharacterString>
                                    <xsl:value-of select="ci:contactInfo/ci:Contact/ci:address/ci:Address/ci:deliveryPoint"/>
                                </gco:CharacterString>
                            </gmd:deliveryPoint>
                            <gmd:city>
                                <gco:CharacterString>
                                    <xsl:value-of select="ci:contactInfo/ci:Contact/ci:address/ci:Address/ci:city"/>
                                </gco:CharacterString>
                            </gmd:city>
                            <gmd:administrativeArea>
                                <gco:CharacterString>
                                    <xsl:value-of select="ci:contactInfo/ci:Contact/ci:address/ci:Address/ci:administrativeArea"/>
                                </gco:CharacterString>
                            </gmd:administrativeArea>
                            <gmd:postalCode>
                                <gco:CharacterString>
                                    <xsl:value-of select="ci:contactInfo/ci:Contact/ci:address/ci:Address/ci:postalCode"/>
                                </gco:CharacterString>
                            </gmd:postalCode>
                            <gmd:country>
                                <gco:CharacterString>
                                    <xsl:value-of select="ci:contactInfo/ci:Contact/ci:address/ci:Address/ci:country"/>
                                </gco:CharacterString>
                            </gmd:country>
                            <xsl:for-each select="ci:contactInfo/ci:Contact/ci:address/ci:Address/ci:electronicMailAddress">
                            <gmd:electronicMailAddress>
                                <gco:CharacterString><xsl:value-of select="../ci:electronicMailAddress"/></gco:CharacterString>
                            </gmd:electronicMailAddress>
                            </xsl:for-each>
                        </gmd:CI_Address>
                    </gmd:address>
                </gmd:CI_Contact>
            </gmd:contactInfo>
            <gmd:role>
                <gmd:CI_RoleCode>
                    <xsl:variable name="role">
                        <xsl:value-of select="ci:role/@rdf:resource"/>
                    </xsl:variable>
                    <xsl:attribute name="codeListValue">
                        <xsl:value-of select="substring-after($role, 'Role/')"/>
                    </xsl:attribute>
                    <xsl:attribute name="codeList"
                        >http://www.isotc211.org/2005/resources/codeList.xml#CI_RoleCode</xsl:attribute>
                </gmd:CI_RoleCode>
            </gmd:role>
        </gmd:CI_ResponsibleParty>
    </xsl:template>

    <!-- IdentificationInfo -->
    <xsl:template match="md:DataIdentification">

        <xsl:choose>
            <xsl:when test="@rdf:about = 'gmd:MD_DataIdentification'">
                <gmd:MD_DataIdentification>
                    <xsl:apply-templates select="md:citation"/>
                    <xsl:apply-templates select="md:abstract"/>
                    <xsl:apply-templates select="md:purpose"/>
                    <xsl:apply-templates select="md:status"/>
                    <xsl:apply-templates select="md:pointOfContact"/>
                    <xsl:apply-templates select="md:resourceMaintenance"/>
                    <xsl:for-each select="md:graphicOverview">
                        <gmd:graphicOverview>
                            <gmd:MD_BrowseGraphic>
                                <gmd:fileName>
                                    <xsl:choose>
                                        <xsl:when test="md:BrowseGraphic/md:fileName != 'missing'">
                                            <gco:CharacterString>
                                                <xsl:value-of select="md:BrowseGraphic/md:fileName"/>
                                            </gco:CharacterString>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:attribute name="gco:nilReason">missing</xsl:attribute>
                                            <gco:CharacterString/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </gmd:fileName>
                                <gmd:fileDescription>
                                    <xsl:choose>
                                        <xsl:when test="md:BrowseGraphic/md:fileDescription != 'missing'">
                                            <gco:CharacterString>
                                                <xsl:value-of select="md:BrowseGraphic/md:fileDescription"/>
                                            </gco:CharacterString>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:attribute name="gco:nilReason">missing</xsl:attribute>
                                            <gco:CharacterString/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </gmd:fileDescription>
                            </gmd:MD_BrowseGraphic>
                        </gmd:graphicOverview>
                    </xsl:for-each>
                    <xsl:for-each select="md:descriptiveKeywords">
                        <gmd:descriptiveKeywords>
                            <gmd:MD_Keywords>
                                <gmd:keyword>
                                    <gco:CharacterString>
                                        <xsl:value-of select="md:Keywords/md:keyword"/>
                                    </gco:CharacterString>
                                </gmd:keyword>
                                <gmd:type>
                                    <gmd:MD_KeywordTypeCode>
                                        <xsl:variable name="keyType">
                                            <xsl:value-of select="md:Keywords/md:type/@rdf:resource"/>
                                        </xsl:variable>
                                        <xsl:attribute name="codeListValue">
                                            <xsl:value-of select="substring-after($keyType, 'KeywordType/')"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/codeList.xml#MD_KeywordTypeCode</xsl:attribute>
                                    </gmd:MD_KeywordTypeCode>
                                </gmd:type>
                            </gmd:MD_Keywords>
                        </gmd:descriptiveKeywords>
                    </xsl:for-each>
                    <xsl:apply-templates select="md:resourceConstraints"/>
                    <xsl:apply-templates select="md:spatialRepresentationType"/>
                    <xsl:apply-templates select="md:spatialResolution"/>
                    <xsl:apply-templates select="md:language"/>
                    <xsl:apply-templates select="md:characterSet"/>
                    <xsl:apply-templates select="md:topicCategory"/>
                    
                    <xsl:for-each select="md:extent/ex:Extent/md:temporalElement">
                        <gmd:extent>
                            <gmd:EX_Extent>
                                <gmd:temporalElement>
                                    <gmd:EX_TemporalExtent>
                                        <gmd:extent>
                                            <gml:TimePeriod>
                                                <xsl:attribute name="id">
                                                    <xsl:value-of select="ex:TemporalExtent/md:extent/tm:TemporalPeriod/@rdf:about"/>
                                                </xsl:attribute>
                                            </gml:TimePeriod>
                                            <gml:beginPosition>
                                                <xsl:value-of select="ex:TemporalExtent/md:extent/tm:Begin"/>
                                            </gml:beginPosition>
                                            <gml:endPosition>
                                                <xsl:value-of select="ex:TemporalExtent/md:extent/tm:End"/>
                                            </gml:endPosition>
                                        </gmd:extent>
                                    </gmd:EX_TemporalExtent>
                                </gmd:temporalElement>
                            </gmd:EX_Extent>
                        </gmd:extent>
                    </xsl:for-each>
                    
                    <xsl:for-each select="md:extent/ex:Extent/ex:geographicElement">
                        <gmd:extent>
                            <gmd:EX_Extent>
                                <gmd:geographicElement>
                                    <gmd:EX_GeographicBoundingBox>
                                        <gmd:westBoundLongitude>
                                            <gco:Decimal>
                                                <xsl:value-of select="ex:GeographicBoundingBox/ex:westBoundLongitude"/>
                                            </gco:Decimal>
                                        </gmd:westBoundLongitude>
                                        <gmd:eastBoundLongitude>
                                            <gco:Decimal>
                                                <xsl:value-of select="ex:GeographicBoundingBox/ex:eastBoundLongitude"/>
                                            </gco:Decimal>
                                        </gmd:eastBoundLongitude>
                                        <gmd:southBoundLatitude>
                                            <gco:Decimal>
                                                <xsl:value-of select="ex:GeographicBoundingBox/ex:southBoundLatitude"/>
                                            </gco:Decimal>
                                        </gmd:southBoundLatitude>
                                        <gmd:northBoundLatitude>
                                            <gco:Decimal>
                                                <xsl:value-of select="ex:GeographicBoundingBox/ex:northBoundLatitude"/>
                                            </gco:Decimal>
                                        </gmd:northBoundLatitude>
                                    </gmd:EX_GeographicBoundingBox>
                                </gmd:geographicElement>
                            </gmd:EX_Extent>
                        </gmd:extent>
                    </xsl:for-each>
                    
                    <xsl:apply-templates select="md:supplementalInformation"/>          
                    
                </gmd:MD_DataIdentification>
            </xsl:when>
            <xsl:otherwise>
                <srv:SV_ServiceIdentification>
                    <xsl:apply-templates select="md:citation"/>
                    <xsl:apply-templates select="md:abstract"/>
                    <xsl:apply-templates select="md:purpose"/>
                    <xsl:apply-templates select="md:status"/>
                    <xsl:apply-templates select="md:pointOfContact"/>
                    <xsl:apply-templates select="md:resourceMaintenance"/>
                    <xsl:for-each select="md:graphicOverview">
                        <gmd:graphicOverview>
                            <gmd:MD_BrowseGraphic>
                                <gmd:fileName>
                                    <xsl:choose>
                                        <xsl:when test="md:BrowseGraphic/md:fileName != 'missing'">
                                            <gco:CharacterString>
                                                <xsl:value-of select="md:BrowseGraphic/md:fileName"/>
                                            </gco:CharacterString>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:attribute name="gco:nilReason">missing</xsl:attribute>
                                            <gco:CharacterString/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </gmd:fileName>
                                <gmd:fileDescription>
                                    <xsl:choose>
                                        <xsl:when test="md:BrowseGraphic/md:fileDescription != 'missing'">
                                            <gco:CharacterString>
                                                <xsl:value-of select="md:BrowseGraphic/md:fileDescription"/>
                                            </gco:CharacterString>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:attribute name="gco:nilReason">missing</xsl:attribute>
                                            <gco:CharacterString/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </gmd:fileDescription>
                            </gmd:MD_BrowseGraphic>
                        </gmd:graphicOverview>
                    </xsl:for-each>
                    <xsl:for-each select="md:descriptiveKeywords">
                        <gmd:descriptiveKeywords>
                            <gmd:MD_Keywords>
                                <gmd:keyword>
                                    <gco:CharacterString>
                                        <xsl:value-of select="md:Keywords/md:keyword"/>
                                    </gco:CharacterString>
                                </gmd:keyword>
                                <gmd:type>
                                    <gmd:MD_KeywordTypeCode>
                                        <xsl:variable name="keyType">
                                            <xsl:value-of select="md:Keywords/md:type/@rdf:resource"/>
                                        </xsl:variable>
                                        <xsl:attribute name="codeListValue">
                                            <xsl:value-of select="substring-after($keyType, 'KeywordType/')"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/codeList.xml#MD_KeywordTypeCode</xsl:attribute>
                                    </gmd:MD_KeywordTypeCode>
                                </gmd:type>
                            </gmd:MD_Keywords>
                        </gmd:descriptiveKeywords>
                    </xsl:for-each>
                    <xsl:apply-templates select="md:resourceConstraints"/>
                    <xsl:apply-templates select="md:spatialRepresentationType"/>
                    <xsl:apply-templates select="md:spatialResolution"/>
                    <xsl:apply-templates select="md:language"/>
                    <xsl:apply-templates select="md:characterSet"/>
                    <xsl:apply-templates select="md:topicCategory"/>
                    
                    <xsl:for-each select="md:extent/ex:Extent/md:temporalElement">
                        <gmd:extent>
                            <gmd:EX_Extent>
                                <gmd:temporalElement>
                                    <gmd:EX_TemporalExtent>
                                        <gmd:extent>
                                            <gml:TimePeriod>
                                                <xsl:attribute name="id">
                                                    <xsl:value-of select="ex:TemporalExtent/md:extent/tm:TemporalPeriod/@rdf:about"/>
                                                </xsl:attribute>
                                            </gml:TimePeriod>
                                            <gml:beginPosition>
                                                <xsl:value-of select="ex:TemporalExtent/md:extent/tm:Begin"/>
                                            </gml:beginPosition>
                                            <gml:endPosition>
                                                <xsl:value-of select="ex:TemporalExtent/md:extent/tm:End"/>
                                            </gml:endPosition>
                                        </gmd:extent>
                                    </gmd:EX_TemporalExtent>
                                </gmd:temporalElement>
                            </gmd:EX_Extent>
                        </gmd:extent>
                    </xsl:for-each>
                    
                    <xsl:for-each select="md:extent/ex:Extent/ex:geographicElement">
                        <gmd:extent>
                            <gmd:EX_Extent>
                                <gmd:geographicElement>
                                    <gmd:EX_GeographicBoundingBox>
                                        <gmd:westBoundLongitude>
                                            <gco:Decimal>
                                                <xsl:value-of select="ex:GeographicBoundingBox/ex:westBoundLongitude"/>
                                            </gco:Decimal>
                                        </gmd:westBoundLongitude>
                                        <gmd:eastBoundLongitude>
                                            <gco:Decimal>
                                                <xsl:value-of select="ex:GeographicBoundingBox/ex:eastBoundLongitude"/>
                                            </gco:Decimal>
                                        </gmd:eastBoundLongitude>
                                        <gmd:southBoundLatitude>
                                            <gco:Decimal>
                                                <xsl:value-of select="ex:GeographicBoundingBox/ex:southBoundLatitude"/>
                                            </gco:Decimal>
                                        </gmd:southBoundLatitude>
                                        <gmd:northBoundLatitude>
                                            <gco:Decimal>
                                                <xsl:value-of select="ex:GeographicBoundingBox/ex:northBoundLatitude"/>
                                            </gco:Decimal>
                                        </gmd:northBoundLatitude>
                                    </gmd:EX_GeographicBoundingBox>
                                </gmd:geographicElement>
                            </gmd:EX_Extent>
                        </gmd:extent>
                    </xsl:for-each>
                    
                    <xsl:apply-templates select="md:supplementalInformation"/>          
                    
                    <srv:serviceType>
                        <gco:LocalName codeSpace="www.w3c.org"><xsl:value-of select="srv:serviceType"/></gco:LocalName>
                    </srv:serviceType>
                    <srv:serviceTypeVersion>
                        <gco:CharacterString><xsl:value-of select="srv:serviceTypeVersion"/></gco:CharacterString>
                    </srv:serviceTypeVersion>
                    <srv:accessProperties>
                        <gmd:MD_StandardOrderProcess>
                            <gmd:fees>
                                <gco:CharacterString><xsl:value-of select="srv:accessProperties/md:StandardOrderProcess/md:fees"/></gco:CharacterString>
                            </gmd:fees>
                        </gmd:MD_StandardOrderProcess>
                    </srv:accessProperties>
                    <xsl:for-each select="srv:coupledResource">
                        <srv:coupledResource>
                            <srv:SV_CoupledResource>
                                <srv:operationName>
                                    <gco:CharacterString><xsl:value-of select="srv:CoupledResource/srv:operationName"/></gco:CharacterString>
                                </srv:operationName>
                                <srv:identifier>
                                    <gco:CharacterString><xsl:value-of select="srv:CoupledResource/srv:identifier"/></gco:CharacterString>
                                </srv:identifier>
                                <gco:ScopedName><xsl:value-of select="srv:CoupledResource/@rdf:about"/></gco:ScopedName>
                            </srv:SV_CoupledResource>
                        </srv:coupledResource>
                    </xsl:for-each>
                    <xsl:for-each select="srv:couplingType">
                        <srv:couplingType>
                            <srv:SV_CouplingType codeList="./resources/codeList.xml#SV_CouplingType">
                                <xsl:attribute name="codeListValue"><xsl:value-of select="srv:CouplingType/@rdf:about"/></xsl:attribute>
                                <xsl:value-of select="srv:CouplingType/@rdf:about"/>
                            </srv:SV_CouplingType>
                        </srv:couplingType>
                    </xsl:for-each>
                    <xsl:for-each select="srv:containsOperations">
                        <srv:containsOperations>
                            <srv:SV_OperationMetadata>
                                <srv:operationName>
                                    <gco:CharacterString><xsl:value-of select="srv:SV_OperationMetadata/srv:operationName"/></gco:CharacterString>
                                </srv:operationName>
                                <xsl:for-each select="srv:SV_OperationMetadata/srv:DCP">
                                    <srv:DCP>
                                        <srv:DCPList>
                                            <xsl:variable name="dcp">
                                                <xsl:value-of select="@rdf:resource"/>
                                            </xsl:variable>
                                            <xsl:attribute name="codeList"
                                                >http://def.seegrid.csiro.au/isotc211/iso19115/2003/code/DCPList/</xsl:attribute>
                                            <xsl:attribute name="codeListValue">
                                                <xsl:value-of select="substring-after($dcp, 'DCPList/')"/>
                                            </xsl:attribute>
                                        </srv:DCPList>
                                    </srv:DCP>
                                </xsl:for-each>
                                
                                <xsl:for-each select="srv:SV_OperationMetadata/srv:connectPoint">
                                    <srv:connectPoint>
                                        <gmd:CI_OnlineResource>
                                            <gmd:linkage>
                                                <gmd:URL>
                                                    <xsl:value-of select="ci:OnlineResource/ci:linkage/rdf:Description/@rdf:about"/>
                                                </gmd:URL>
                                            </gmd:linkage>
                                            <gmd:protocol>
                                                <gco:CharacterString>
                                                    <xsl:value-of select="ci:OnlineResource/ci:protocol"/>
                                                </gco:CharacterString>
                                            </gmd:protocol>
                                            <gmd:description>
                                                <gco:CharacterString>
                                                    <xsl:value-of select="ci:OnlineResource/ci:description"/>
                                                </gco:CharacterString>
                                            </gmd:description>
                                            <xsl:for-each select="ci:OnlineResource/ci:function">
                                                <gmd:function>
                                                    <gmd:CI_OnlineFunctionCode>
                                                        <xsl:variable name="code">
                                                            <xsl:value-of select="@rdf:resource"/>
                                                        </xsl:variable>
                                                        <xsl:attribute name="codeListValue">
                                                            <xsl:value-of select="substring-after($code, 'OnlineFunctionCode/')"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/codeList.xml#MD_OnlineFunctionCode</xsl:attribute>
                                                    </gmd:CI_OnlineFunctionCode>
                                                </gmd:function>
                                            </xsl:for-each>
                                        </gmd:CI_OnlineResource>    
                                    </srv:connectPoint>
                                </xsl:for-each>
                            </srv:SV_OperationMetadata>
                        </srv:containsOperations>
                    </xsl:for-each>   
                    <xsl:for-each select="srv:operatesOn">
                        <srv:operatesOn>
                            <xsl:attribute name="uuidref">
                                <xsl:value-of select="../srv:operatesOn"></xsl:value-of>
                            </xsl:attribute>
                        </srv:operatesOn>
                    </xsl:for-each>
                </srv:SV_ServiceIdentification>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="md:citation">
        <gmd:citation>
            <gmd:CI_Citation>
                <gmd:title>
                    <gco:CharacterString>
                        <xsl:value-of select="ci:Citation/ci:title"/>
                    </gco:CharacterString>
                </gmd:title>
                <gmd:date>
                    <gmd:CI_Date>
                        <gmd:date>
                            <gco:DateTime>
                                <xsl:value-of select="ci:Citation/ci:date/ci:Date/ci:Date.date"/>
                            </gco:DateTime>
                        </gmd:date>
                        <gmd:dateType>
                            <gmd:CI_DateTypeCode>
                                <xsl:variable name="dateType">
                                    <xsl:value-of select="ci:Citation/ci:date/ci:Date/ci:dateType/@rdf:resource" />
                                </xsl:variable>
                                <xsl:attribute name="codeListValue">
                                    <xsl:value-of select="substring-after($dateType, 'DateType/')"/>
                                </xsl:attribute>
                                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/codeList.xml#CI_DateTypeCode</xsl:attribute>
                            </gmd:CI_DateTypeCode>
                        </gmd:dateType>
                    </gmd:CI_Date>
                </gmd:date>
                <gmd:edition>
                    <gco:CharacterString>
                        <xsl:value-of select="ci:Citation/ci:edition"/>
                    </gco:CharacterString>
                </gmd:edition>
                <gmd:presentationForm>
                    <gmd:CI_PresentationFormCode>
                        <xsl:variable name="presForm">
                            <xsl:value-of select="ci:Citation/ci:presentationForm/@rdf:resource"/>
                        </xsl:variable>
                        <xsl:attribute name="codeListValue">
                            <xsl:value-of select="substring-after($presForm, 'PresentationForm/')"/>
                        </xsl:attribute>
                        <xsl:attribute name="codeList"
                            >http://www.isotc211.org/2005/resources/codeList.xml#CI_PresentationFormCode</xsl:attribute>
                    </gmd:CI_PresentationFormCode>
                </gmd:presentationForm>
            </gmd:CI_Citation>
        </gmd:citation>
    </xsl:template>
    <xsl:template match="md:abstract">
        <gmd:abstract>
            <gco:CharacterString>
                <xsl:value-of select="../md:abstract"/>
            </gco:CharacterString>
        </gmd:abstract>
    </xsl:template>
    <xsl:template match="md:purpose">
        <gmd:purpose>
            <xsl:choose>
                <xsl:when test="md:purpose != 'missing'">
                    <gco:CharacterString>
                        <xsl:value-of select="md:purpose"/>
                    </gco:CharacterString>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="gco:nilReason">missing</xsl:attribute>
                    <gco:CharacterString/>
                </xsl:otherwise>
            </xsl:choose>
        </gmd:purpose>
    </xsl:template>
    <xsl:template match="md:status">
        <gmd:status>
            <gmd:MD_ProgressCode>
                <xsl:variable name="progress">
                    <xsl:value-of select="@rdf:resource"/>
                </xsl:variable>
                <xsl:attribute name="codeListValue">
                    <xsl:value-of select="substring-after($progress, 'Progress/')"/>
                </xsl:attribute>
                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/codeList.xml#MD_ProgressCode</xsl:attribute>
            </gmd:MD_ProgressCode>
        </gmd:status>
    </xsl:template>
    <xsl:template match="md:pointOfContact">
        <gmd:pointOfContact>
            <xsl:apply-templates select="ci:ResponsibleParty"/>
        </gmd:pointOfContact>
    </xsl:template>
    <xsl:template match="md:resourceMaintenance">
        <gmd:resourceMaintenance>
            <gmd:MD_MaintenanceInformation>
                <gmd:maintenanceAndUpdateFrequency>
                    <gmd:MD_MaintenanceFrequencyCode>
                        <xsl:variable name="maint">
                            <xsl:value-of select="md:MaintenanceInformation/md:maintenanceAndUpdateFrequency/@rdf:resource"/>
                        </xsl:variable>
                        <xsl:attribute name="codeListValue">
                            <xsl:value-of select="substring-after($maint, 'MaintenanceFrequency/')"/>
                        </xsl:attribute>
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/codeList.xml#MD_MaintenanceFrequencyCode</xsl:attribute>
                    </gmd:MD_MaintenanceFrequencyCode>
                </gmd:maintenanceAndUpdateFrequency>
            </gmd:MD_MaintenanceInformation>
        </gmd:resourceMaintenance>
    </xsl:template>
    <xsl:template match="md:resourceConstraints">
        <gmd:resourceConstraints>
            <gmd:MD_LegalConstraints>
                <gmd:accessConstraints>
                    <xsl:choose>
                        <xsl:when test="md:LegalConstraints/md:accessConstraints != 'missing'">
                            <gmd:MD_RestrictionCode>
                                <xsl:variable name="constraint">
                                    <xsl:value-of select="md:LegalConstraints/md:accessConstraints/@rdf:resource"/>
                                </xsl:variable>
                                <xsl:attribute name="codeListValue">
                                    <xsl:value-of select="substring-after($constraint, 'Restriction/')"/>
                                </xsl:attribute>
                                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/codeList.xml#MD_RestrictionCode</xsl:attribute>
                            </gmd:MD_RestrictionCode>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="gco:nilReason">missing</xsl:attribute>
                            <gco:CharacterString/>
                        </xsl:otherwise>
                    </xsl:choose>
                </gmd:accessConstraints>
                <gmd:useConstraints>
                    <xsl:choose>
                        <xsl:when test="md:LegalConstraints/md:useConstraints != 'missing'">
                            <gmd:MD_RestrictionCode>
                                <xsl:variable name="constraint">
                                    <xsl:value-of select="md:LegalConstraints/md:useConstraints/@rdf:resource"/>
                                </xsl:variable>
                                <xsl:attribute name="codeListValue">
                                    <xsl:value-of select="substring-after($constraint, 'Restriction/')"/>
                                </xsl:attribute>
                                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/codeList.xml#MD_RestrictionCode</xsl:attribute>
                            </gmd:MD_RestrictionCode>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="gco:nilReason">missing</xsl:attribute>
                            <gco:CharacterString/>
                        </xsl:otherwise>
                    </xsl:choose>
                </gmd:useConstraints>
                <gmd:otherConstraints>
                    <xsl:choose>
                        <xsl:when test="md:LegalConstraints/md:otherConstraints != 'missing'">
                            <gmd:MD_RestrictionCode>
                                <xsl:variable name="constraint">
                                    <xsl:value-of select="md:LegalConstraints/md:otherConstraints/@rdf:resource"/>
                                </xsl:variable>
                                <xsl:attribute name="codeListValue">
                                    <xsl:value-of select="substring-after($constraint, 'Restriction/')"/>
                                </xsl:attribute>
                                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/codeList.xml#MD_RestrictionCode</xsl:attribute>
                            </gmd:MD_RestrictionCode>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="gco:nilReason">missing</xsl:attribute>
                            <gco:CharacterString/>
                        </xsl:otherwise>
                    </xsl:choose>
                </gmd:otherConstraints>
            </gmd:MD_LegalConstraints>
        </gmd:resourceConstraints>
    </xsl:template>
    <xsl:template match="md:spatialRepresentationType">
        <gmd:spatialRepresentationType>
            <gmd:MD_SpatialRepresentationTypeCode>
                <xsl:variable name="code">
                    <xsl:value-of select="@rdf:resource"/>
                </xsl:variable>
                <xsl:attribute name="codeListValue">
                    <xsl:value-of select="substring-after($code, 'Type/')"/>
                </xsl:attribute>
                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/codeList.xml#MD_RestrictionCode</xsl:attribute>
            </gmd:MD_SpatialRepresentationTypeCode>
        </gmd:spatialRepresentationType>
    </xsl:template>
    <xsl:template match="md:spatialResolution">
        <gmd:spatialResolution>
            <gmd:MD_Resolution>
                <gmd:equivalentScale>
                    <gmd:MD_RepresentativeFraction>
                        <gmd:denominator>
                            <gco:Integer>
                                <xsl:value-of select="md:RepresentativeFraction/md:denominator"/>
                            </gco:Integer>
                        </gmd:denominator>
                    </gmd:MD_RepresentativeFraction>
                </gmd:equivalentScale>
            </gmd:MD_Resolution>
        </gmd:spatialResolution>
    </xsl:template>
    <xsl:template match="md:language">
        <gmd:language>
            <gco:CharacterString>
                <xsl:value-of select="../md:language"/>
            </gco:CharacterString>
        </gmd:language>
    </xsl:template>    
    <xsl:template match="md:characterSet">
        <gmd:characterSet>
            <gmd:MD_CharacterSetCode>
                <xsl:variable name="code">
                    <xsl:value-of select="@rdf:resource"/>
                </xsl:variable>
                <xsl:attribute name="codeListValue">
                    <xsl:value-of select="substring-after($code, 'CharacterSet/')"/>
                </xsl:attribute>
                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/codeList.xml#MD_CharacterSetCode</xsl:attribute>
            </gmd:MD_CharacterSetCode>
        </gmd:characterSet>
    </xsl:template>
    <xsl:template match="md:topicCategory">
        <gmd:topicCategory>
            <gmd:MD_TopicCategoryCode>
                <xsl:variable name="category">
                    <xsl:value-of select="@rdf:resource"/>
                </xsl:variable>
                <xsl:value-of select="substring-after($category, 'TopicCategory/')"/>
            </gmd:MD_TopicCategoryCode>
        </gmd:topicCategory>
    </xsl:template>
    <xsl:template match="md:supplementalInformation">
        <gmd:supplementalInformation>
            <xsl:choose>
                <xsl:when test="../md:supplementalInformation != 'missing'">
                    <gco:CharacterString>
                        <xsl:value-of select="../md:supplementalInformation"/>
                    </gco:CharacterString>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="gco:nilReason">missing</xsl:attribute>
                    <gco:CharacterString/>
                </xsl:otherwise>
            </xsl:choose>
        </gmd:supplementalInformation>
    </xsl:template>
    
    <!-- Distribution -->
    <xsl:template match="md:Distribution">
        <gmd:MD_Distribution>
            <gmd:transferOptions>
                <gmd:MD_DigitalTransferOptions>
                    <xsl:for-each
                        select="md:transferOptions/md:DigitalTransferOptions/md:online">
                        <gmd:onLine>
                            <gmd:CI_OnlineResource>
                                <gmd:linkage>
                                    <gmd:URL>
                                        <xsl:value-of select="ci:OnlineResource/ci:linkage/rdf:Description/@rdf:about"/>
                                    </gmd:URL>
                                </gmd:linkage>
                                <gmd:protocol>
                                    <gco:CharacterString>
                                        <xsl:value-of select="ci:OnlineResource/ci:protocol"/>
                                    </gco:CharacterString>
                                </gmd:protocol>
                                <gmd:name>
                                    <gco:CharacterString>
                                        <xsl:value-of select="ci:OnlineResource/ci:name"/>
                                    </gco:CharacterString>
                                </gmd:name>
                                <gmd:description>
                                    <gco:CharacterString>
                                        <xsl:value-of select="ci:OnlineResource/ci:description"/>
                                    </gco:CharacterString>
                                </gmd:description>
                                <xsl:for-each select="ci:function">
                                    <gmd:function>
                                        <gmd:CI_OnlineFunctionCode>
                                            <xsl:variable name="code">
                                                <xsl:value-of select="ci:OnlineResource/ci:function/@rdf:resource"/>
                                            </xsl:variable>
                                            <xsl:attribute name="codeListValue">
                                                <xsl:value-of select="substring-after($code, 'OnlineFunctionCode/')"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/codeList.xml#MD_OnlineFunctionCode</xsl:attribute>
                                        </gmd:CI_OnlineFunctionCode>
                                    </gmd:function>
                                </xsl:for-each>
                            </gmd:CI_OnlineResource>
                        </gmd:onLine>
                    </xsl:for-each>
                </gmd:MD_DigitalTransferOptions>
            </gmd:transferOptions>
        </gmd:MD_Distribution>
    </xsl:template>
    
    <!-- DataQuality -->
    <xsl:template match="dq:DataQuality">
        <gmd:DQ_DataQuality>
            <gmd:scope>
                <gmd:DQ_Scope>
                    <gmd:level>
                        <gmd:MD_ScopeCode>
                            <xsl:variable name="code">
                                <xsl:value-of select="dq:scope/dq:Scope/dq:level/@rdf:resource"/>
                            </xsl:variable>
                            <xsl:attribute name="codeListValue">
                                <xsl:value-of select="substring-after($code, 'Scope/')"/>
                            </xsl:attribute>
                            <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/codeList.xml#MD_ScopeCode</xsl:attribute>
                        </gmd:MD_ScopeCode>
                    </gmd:level>
                </gmd:DQ_Scope>
            </gmd:scope>
            <gmd:lineage>
                <gmd:LI_Lineage>
                    <gmd:statement>
                        <xsl:choose>
                            <xsl:when test="dq:lineage/li:Lineage/li:statement != 'missing'">
                                <gco:CharacterString>
                                    <xsl:value-of select="dq:lineage/li:Lineage/li:statement"/>
                                </gco:CharacterString>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="gco:nilReason">missing</xsl:attribute>
                                <gco:CharacterString/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </gmd:statement>
                </gmd:LI_Lineage>
            </gmd:lineage>
        </gmd:DQ_DataQuality>
    </xsl:template>
</xsl:stylesheet>
