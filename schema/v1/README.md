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






