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

De inhoud van de Payment Due List wordt versleuteld volgens AES 128-CBC, de gebruikte sleutel wordt met het publieke deel van het RSA sleutelpaar versleuteld volgens RSAES-OAEP.
De syntax voor een Payment Due List wordt daarmee:

    <EncryptedData xmlns="http://www.w3.org/2001/04/xmlenc"
        Type="http://www.w3.org/2001/04/xmlenc#Content">
        <EncryptionMethod Algorithm="http://www.w3.org/2001/04/xmlenc#aes128-cbc" />
        <ds:KeyInfo xmlns:ds="http://www.w3.org/2000/09/xmldsig#">
            <EncryptedKey>
				<EncryptionMethod
					Algorithm="http://www.w3.org/2001/04/xmlenc#rsa-oaep-mgf1p"/>
				<CipherData><CipherValue>
            </EncryptedKey>
        </ds:KeyInfo>
        <CipherData>
            <CipherValue>
        </CipherData>
    </EncryptedData>


### Voorbeeld

	<?xml version="1.0" encoding="UTF-8"?>
	<!--Voorbeeld van een versleutelde openstaande factuur waarvan de vervaldatum nog niet is gepasseerd.-->
	<!--Betaalwijze automatische incasso.-->
	<xenc:EncryptedData xmlns:xenc="http://www.w3.org/2001/04/xmlenc#" Type="http://www.w3.org/2001/04/xmlenc#Element">
	  <xenc:EncryptionMethod Algorithm="http://www.w3.org/2001/04/xmlenc#aes128-cbc"/>
	  <ds:KeyInfo xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:dsig="http://www.w3.org/2000/09/xmldsig#">
	    <xenc:EncryptedKey xmlns:xenc="http://www.w3.org/2001/04/xmlenc#">
	      <xenc:EncryptionMethod Algorithm="http://www.w3.org/2001/04/xmlenc#rsa-oaep-mgf1p"/>
	      <xenc:CipherData>
	        <xenc:CipherValue>ANlVWhxP62DScbyueRjY4LzHwL2xlL44hFfhbT0/qRtKCiSUgFwWigsewos7qHj6APsBjHv+AA8j&#13;
	OP5cA8BO3w0oBquAqGxjFAfqKoAGWCWEZ29xKH6zIy7wRsyC8yO46Clljvgp27q9a9AhLEs5XfeF&#13;
	g0eDb/73AWV/z+okzGQ=</xenc:CipherValue>
	      </xenc:CipherData>
	    </xenc:EncryptedKey>
	  </ds:KeyInfo>
	  <xenc:CipherData>
	    <xenc:CipherValue>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</xenc:CipherValue>
	  </xenc:CipherData>
	</xenc:EncryptedData>
	
### Opvragen van een versleutelde Payment Due List met Qiy

Een versleutelde Payment Due List kan ook met Qiy worden opgevraagd. De beschrijving hiervan is opgenomen in de Qiy Node API, zie:
https://qiy.api.digital-me.nl/?version=latest#3811d8af-3dce-421e-8d3e-cf38963ad1c6.

