#//# --------------------------------------------------------------------------------------
#//# Created using Sequence Diagram for Mac
#//# https://www.macsequencediagram.com
#//# https://itunes.apple.com/gb/app/sequence-diagram/id1195426709?mt=12
#//# --------------------------------------------------------------------------------------
# fiKks iIntegratie overzicht voor schuldeisers
# Schuldeiser node setup

participant "Schuldeiser"				as DP
participant "Qiy Access Provider"		as AP
participant "Schuldeiser node"		as NodeDP

region Schuldeiser node setup

	DP	-> AP		: request Schuldeiser node

	activate NodeDP
	AP -> NodeDP	: Initiate

end

region Register "inzage eigen gegevens" service

	DP	->	NodeDP	: Register

end
