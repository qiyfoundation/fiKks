#//# --------------------------------------------------------------------------------------
#//# Created using websequencediagrams.com
#//# --------------------------------------------------------------------------------------
# fiKks iIntegratie overzicht voor schuldeisers
# Schuldeiser node setup

title Node setup schuldeiser

participant "Schuldeiser"         as DP
participant "Qiy Access Provider" as AP
participant "Schuldeiser node"    as NodeDP

	DP	-> AP		: Request Schuldeiser node

	AP ->+ NodeDP	: Initiate

	DP	->	NodeDP	: Register "inzage eigen gegevens" service

