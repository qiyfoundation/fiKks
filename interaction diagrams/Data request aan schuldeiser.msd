#//# --------------------------------------------------------------------------------------
#//# Created using Sequence Diagram for Mac
#//# https://www.macsequencediagram.com
#//# https://itunes.apple.com/gb/app/sequence-diagram/id1195426709?mt=12
#//# --------------------------------------------------------------------------------------
# fiKks iIntegratie overzicht voor schuldeisers
# Data request 

participant "fiKks App"			as AppRP
participant "fiKks back-end"	as BackEndRP
participant "Schuldeiser"		as DP
participant "Connection #2"	as C2
participant "User node"			as NodeUser
participant "Connection #1"	as C1

activate Node
activate C1
activate C2

region [Data request]

  region voorbereiden
	BackEndRP		-> C1			: opvragen schulden informatie
	C1				-> NodeUser	: opvragen schulden informatie
	NodeUser		-> AppRP		: vraag instemming

	NodeUser		-> C2			: opvragen schulden informatie
	C2				-> DP			: opvragen schulden informatie
  end

  region verstrek data referentie
	DP				-> C2			: registreer operatie
	DP				-> C2			: data referentie
	C2				-> NodeUser	: data referentie
	NodeUser		-> C1			: data referentie
	C1				-> BackEndRP	: data  referentie
  end

 loop gegevens opvragen 

	note over BackEndRP
		Opmerking					: logische weergave
	end note

	activate DP
		BackEndRP	-> DP			: request data referentie
		DP			-> BackEndRP	: response
	deactivate DP

 end

end