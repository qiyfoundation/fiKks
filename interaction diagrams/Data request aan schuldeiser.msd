#//# --------------------------------------------------------------------------------------
#//# Created using websequencediagrams.com
#//# --------------------------------------------------------------------------------------
# fiKks integratie overzicht voor schuldeisers

title Data Reuse
 
participant "fiKks back-end"     as BeRP
participant "Qiy Trust Network"  as QTN
participant "fiKks App"          as AppRP
participant "Schuldeiser"        as DP

	BeRP  ->  QTN    : vragen consent
	QTN   ->  AppRP  : vragen consent
	AppRP --> QTN    : consent

	QTN	  ->  DP	 : opvragen operatie
	DP    -->  QTN   : operatie
	QTN   --> BeRP  : referentie

     loop gegevens opvragen 
    
    	BeRP ->  QTN	: request met referentie
    	QTN  -> QTN     : opzoeken operatie
    	QTN  -> DP      : uitvoeren operatie
    	DP   --> QTN    : data
    	QTN  --> BeRP	: data

     end

