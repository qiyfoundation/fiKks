# Schema 1.0 implementatie richlijn

## Inleiding
Schema 1.0 implementatie richtlijn bevat instructies over de gegevensstructuur en semantiek van velden die moeten worden ingevuld in een overzicht van openstaande betalingen en betalingsregelingen gericht aan consumenten (B2C).

Schema 1.0 is een subset op basis van de UBL-2.1 specificaties welke is te vinden op [http://docs.oasis-open.org/ubl/os-UBL-2.1/]()

### Doelstelling
Het doel van deze richtlijn is om het gebruik van klassen en elementen te specificeren die worden gebruikt om openstaande betalingen en betalingsregelingen te specificeren.

### Samenvatting
* Payment Due List communiceert informatie van een organisatie aan de klant over welke betalingen door de klant verschuldigd zijn (openstand en achterstand).
* Een Payment Due List beoogt middels een een lijst van Invoice klassen een zo volledig mogelijk overzicht te verstrekken van alle door de klant verschuldigde betalingen.
* Een Payment Duel List biedt middels Payment Means informatie over de wijze waarop een betaling kan worden voldaan.
* Een Payment Due List biedt middels Payment Terms informatie over de voorwaarden waaronder een betaling dient te worden voldaan.
* Een Payment Due List biedt middels een lijst van Installment klassen een zo volledig mogelijk overzicht van overeengekomen betalingsafspraken met betrekking tot de in de lijst van Invoice klassen benoemde verschuldigde betalingen.
 
## Payment Due List klassen en elementen
Een Payment Due List klasse geeft een lijst van Invoice klassen, welke openstaande betalingen specificeren, en Installment klassen, welke overeengekomen betalingsafspraken specificeren.

De specificatie van de Payment Due List is beschreven in het XML schema [PaymentDueList.xsd](xsd/PaymentDueList-1.0.xsd)

### Invoice klasse

### Payment Means klasse
De Payment Means klasse beschrijft de betaalwijze waarop een betaling dient te worden uitgevoerd. Er mogen dan ook meerdere Payment Means klassen worden opgenomen en kunnen worden gekoppeld aan betalingsvoorwaarden zoals beschreven door de Payment Terms klasse.

Toegepaste elementen zijn:

#### Payment Means ID

Payment Means ID wordt gebruikt om onderscheid te maken tussen Payment Means wanneer
meer dan ��n instantie is opgegeven. Het gebruik van volgnummers is aanbevolen.

#### Payment Means Code

Codes die zowel handmatige als elektronische betaalmiddelen vertegenwoordigen.

Als er geen specifieke specifieke betalingswijze vereist is, is de code van de betalingswijze = "1" (niet gedefinieerd).

#### PaymentDueDate

Gebruikt om de uiterlijke betaaldatum voor een betaalwijze te specificeren specificeren.

#### InstructionID

Code welke de klant dient te gebruiken waaraan de organisatie als ontvanger van een betaling een betaling kan identificeren en herleiden tot een openstaande post. 
  
#### PayeeFinancialAccount

Specificatie van het bankrekening nummer van de begunstigde welke een klant dient te gebruiken in het geval van een door de klant geïnitieerd elektronische betaling.

#### PayerFinancialAccount

Specificatie van het bankrekening nummer van de klant om een door de organisatie geïnitieerde elektronische betaling  bij de klant te innen. Dit element wordt gebruikt in geval van bijvoorbeeld een incasso machtiging.

#### Voorbeeld 

Voorbeeld van betaalwijze middels een bankoverschrijving:

    <cac:PaymentMeans>
    	<cbc:ID>1</cbc:ID>
    	<cbc:PaymentMeansCode listID="UN/ECE 4461" listName="Payment Means" listURI="http://docs.oasis-open.org/ubl/os-UBL-2.0-update/cl/gc/default/PaymentMeansCode-2.0.gc">31</cbc:PaymentMeansCode>
    	<cbc:PaymentDueDate>2017-12-15</cbc:PaymentDueDate>
    	<cbc:InstructionNote>000123456789</cbc:InstructionNote>
    	<cac:PayeeFinancialAccount>
    		<cbc:ID schemeName="IBAN">NL51RABO012345678</cbc:ID>
    		<cac:FinancialInstitutionBranch>
    			<cac:FinancialInstitution>
    				<cbc:ID schemeName="BIC">RABONL2U</cbc:ID>
    			</cac:FinancialInstitution>
    		</cac:FinancialInstitutionBranch>
    	</cac:PayeeFinancialAccount>
    </cac:PaymentMeans>

Voorbeeld van betaalwijze op basis van een incasso machtiging:

	<cac:PaymentMeans>
		<cbc:ID>1</cbc:ID>
		<cbc:PaymentMeansCode listID="UN/ECE 4461" listName="Payment Means" listURI="http://docs.oasis-open.org/ubl/os-UBL-2.0-update/cl/gc/default/PaymentMeansCode-2.0.gc">49</cbc:PaymentMeansCode>
		<cbc:PaymentDueDate>2017-12-15</cbc:PaymentDueDate>
		<cbc:InstructionNote>000123456789</cbc:InstructionNote>
		<cac:PayerFinancialAccount>
			<cbc:ID schemeName="IBAN">NL47ABNA0xxxxx678</cbc:ID>
		</cac:PayeeFinancialAccount>
	</cac:PaymentMeans>

>  Opmerking: vanuit privacy overwegingen dient het de aanbeveling in geval van een incasso machtiging een deel van het klant rekening nummer te maskeren: NL47ABNA0xxxxx678.

### Payment Terms

Betalingsvoorwaarden beschrijven informatie van een organisatie aan de klant over voorwaarden die van toepassing zijn op een betaling, bijvoorbeeld kosten die van toepassing kunnen zijn als de betaling te laat is of kortingen als de betaling te vroeg is. Er kunnen meerdere betalingsvoorwaarden gespecificeerd en aan betaalwijzen worden gerelateerd. 

>  Betalingsvoorwaarden zijn informatief en hun waarden zijn niet opgenomen in de totalen van de facturen.

#### Payment Terms ID

Payment Terms ID wordt gebruikt om onderscheid te maken tussen Payment Terms wanneer
meer dan één instantie is opgegeven. Het gebruik van volgnummers is aanbevolen.

#### Payment Means ID

Referentie aan specifiek Payment Means ID waarop de betalingsvoorwaarde van toepassing is.

Indie het Payment Means ID is opgegeven, zijn de betalingsvoorwaarden alleen van toepassing op de opgegeven betaalwijze (en niet op andere betaalwijzen).

#### Settlement Discount Amount
Bedrag dat in mindering mag worden gebracht bij betaling onder betreffende voorwaarden.

Er kan ook gebruik gemaakt worden van een percentage specificatie middels het Settlement Discount Percent element.

#### Penalty Surcharge Amount
Bedrag waar mee het openstaande bedrag vermeerderd dient te worden indien aan de boete voorwaarden wordt voldoaan.

Er kan ook gebruik gemaakt worden van een percentage specificatie middels het Penalty Surcharge Percent element.

#### Settlement Period

Settlement Period geeft de datums aan die moeten worden gebruikt bij het berekenen van kortingen voor de gegeven betalingsvoorwaarden. Bijvoorbeeld als voor een bepaalde datum de betaling wordt voldaan.

#### Penalty Period

Penalty Period geeft de datums aan die moeten worden gebruikt bij het berekenen van boetes voor de gegeven betalingsvoorwaarden. Bijvoorbeeld als de vervaldatum van de betaling (aangegeven in Payment Means) is gepasseerd.

#### Voorbeeld

Voorbeeld van PaymentTerms bij betaling door klant via bankoverschrijving:

	<cac:PaymentTerms>
		<cbc:ID>2</cbc:ID>
		<cbc:PaymentMeansID>1</cbc:PaymentMeansID>
		<cbc:Note>Uw betaling dient uiterlijk op 31 december 2017 op onze rekening te zijn bijgeschreven.</cbc:Note>
		<cac:SettlementPeriod>
			<cbc:EndDate>2017-12-31</cbc:EndDate> 
		</cac:SettlementPeriod>
	</cac:PaymentTerms>

Voorbeeld van PaymentTerms bij een incasso machtiging:

    <cac:PaymentTerms>
    	<cbc:ID>1</cbc:ID>
    	<cbc:PaymentMeansID>1</cbc:PaymentMeansID>
    	<cbc:Note>Het factuurbedrag wordt omstreeks 10 December automatisch van uw rekening afgeschreven.</cbc:Note>
    	<cbc:PaymentDueDate>2017-12-15</cbc:PaymentDueDate>
    	<cac:SettlementPeriod>
    		<cbc:StartDate>2017-12-10</cbc:StartDate>
    	</cac:SettlementPeriod>
    	<cac:ValidityPeriod>
    		<cbc:EndDate>2017-12-31</cbc:EndDate>
    	</cac:ValidityPeriod>
    </cac:PaymentTerms>


>  Indien er geen betalingsvoorwaarden zijn opgegeven, zijn algemene betalingsvoorwaarden overeengekomen tussen de leverancier en de klant van toepassing.

### Legal Monetary Total

De Legal Monetary Total beschrijft de verschillende totaalbedragen die gezamenlijk het totaal van het openstaande bedrag vormen.

#### LineExtensionAmount 
Het geldbedrag van de factuurregels, na aftrek van belastingen en afwikkelingskortingen, maar inclusief alle toepasselijke afrondingsbedragen.

#### TaxInclusiveAmount

Het geldbedrag inclusief belastingen; de som van het te betalen bedrag en het voorafbetaalde bedrag.

#### ChargeTotalAmount 

Het totale geldbedrag van alle bijkomende kosten en boetes.

#### AllowanceTotalAmount

Het totale geldbedrag van alle kortingen en bijkomende toeslagen.

#### PrepaidAmount

Het totale geldbedrag dat inmiddels is voldaan of onderdeel was van een aanbetaling.

#### PayableAmount

Het totale geldbedrag dat nog dient te worden voldaan.

#### Voorbeelden

Voorbeeld van een volledig openstaande verschuldigd bedrag:

    <cac:LegalMonetaryTotal>
    	<cbc:TaxInclusiveAmount currencyID="EUR">122.20</cbc:TaxInclusiveAmount>
    	<cbc:PayableAmount currencyID="EUR">122.20</cbc:PayableAmount>
    </cac:LegalMonetaryTotal>

Voorbeeld van een openstaande verschuldigd bedrag na een gedeeltelijke betaling:

    <cac:LegalMonetaryTotal>
    	<cbc:TaxInclusiveAmount currencyID="EUR">122.20</cbc:TaxInclusiveAmount>
    	<cbc:PrepaidAmount currencyID="EUR">50.00</cbc:PrepaidAmount>
    	<cbc:PayableAmount currencyID="EUR">72.20</cbc:PayableAmount>
    </cac:LegalMonetaryTotal>

Voorbeeld van een openstaande verschuldigd bedrag, inclusief boete, en na een gedeeltelijke betaling:

    <cac:LegalMonetaryTotal>
     	<cbc:TaxInclusiveAmount currencyID="EUR">122.20</cbc:TaxInclusiveAmount>
    	<cbc:PrepaidAmount currencyID="EUR">50.00</cbc:PrepaidAmount>
    	<cbc:ChargeTotalAmount currencyID="EUR">35.00</cbc:ChargeTotalAmount>
    	<cbc:PayableAmount currencyID="EUR">107.20</cbc:PayableAmount>
    </cac:LegalMonetaryTotal>


## Payment Due List Encryption

De Payment Due List moet versleuteld worden uitgewisseld als er een publiek deel van een RSA sleutelpaar beschikbaar is, en wel op basis van XML Encryption Syntax and Processing Version 1.1, zie https://www.w3.org/TR/xmlenc-core1/.
Met de XML encryptie standaard kunnen XML documenten of delen daarvan (meervoudig) versleuteld worden met deze algemene syntax:

    <EncryptedData Id? Type? MimeType? Encoding?>
      <EncryptionMethod/>?
      <ds:KeyInfo>
        <EncryptedKey>?
        <AgreementMethod>?
        <ds:KeyName>?
        <ds:RetrievalMethod>?
        <ds:*>?
      </ds:KeyInfo>?
      <CipherData>
        <CipherValue> | <CipherReference URI?>
      </CipherData>
      <EncryptionProperties>?
    </EncryptedData> 

De inhoud van de Payment Due List wordt versleuteld volgens AES 128-CBC, de gebruikte sleutel wordt met het publieke deel van het RSA sleutelpaar versleuteld.
De syntax voor een Payment Due List wordt daarmee:

	<PaymentDueList>
	    <EncryptedData xmlns="http://www.w3.org/2001/04/xmlenc"
	        Type="http://www.w3.org/2001/04/xmlenc#Content">
	        <EncryptionMethod Algorithm="http://www.w3.org/2001/04/xmlenc#aes128-cbc" />
	        <ds:KeyInfo xmlns:ds="http://www.w3.org/2000/09/xmldsig#">
	            <EncryptedKey>
					<EncryptionMethod
						Algorithm="http://www.w3.org/2001/04/xmlenc#rsa-1_5"/>
					<CipherData><CipherValue>
	            </EncryptedKey>
	        </ds:KeyInfo>
	        <CipherData>
	            <CipherValue>
	        </CipherData>
	    </EncryptedData>
	</PaymentDueList>


### Voorbeeld

    <?xml version="1.0" encoding="UTF-8"?>
	<!--Voorbeeld van een versleutelde openstaande factuur waarvan de vervaldatum nog niet is gepasseerd.-->
	<!--Betaalwijze automatische incasso.-->
	<PaymentDueList xmlns="urn:qiyfoundation.org:names:fikks:schema:xsd:PaymentDueList"
		xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		xsi:schemaLocation="urn:qiyfoundation.org:names:fikks:schema:xsd:PaymentDueList https://raw.githubusercontent.com/qiyfoundation/fiKks/master/schema/v1/xsd/PaymentDueList-1.0.xsd"
		xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
		xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2">
	    <EncryptedData xmlns="http://www.w3.org/2001/04/xmlenc"
	        Type="http://www.w3.org/2001/04/xmlenc#Content">
	        <EncryptionMethod Algorithm="http://www.w3.org/2001/04/xmlenc#aes128-cbc" />
	        <ds:KeyInfo xmlns:ds="http://www.w3.org/2000/09/xmldsig#">
	            <EncryptedKey>
					<EncryptionMethod
						Algorithm="http://www.w3.org/2001/04/xmlenc#rsa-1_5"/>
					<CipherData><CipherValue>
						uE4BeFaIaBjoRQWUPdzzlhnVdQVsijVawcIkurMykWAMbc7rDx8iLACIHTv9uEuhm8MJCfgsMy7eTynpZaLxfYIeQ8FVMUVX3Am2Y9ytEXca3tKMQpw7MPcOX14XjOgvNT5Ld/PRG9j914+/rT5Sh00sE8xogxf2OH/5Urjzf7I=
					</CipherValue></CipherData>
	            </EncryptedKey>
	        </ds:KeyInfo>
	        <CipherData>
	            <CipherValue>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
	            </CipherValue>
	        </CipherData>
	    </EncryptedData>
	</PaymentDueList>


