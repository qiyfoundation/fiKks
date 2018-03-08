#//# --------------------------------------------------------------------------------------
#//# Created using Sequence Diagram for Mac
#//# https://www.macsequencediagram.com
#//# https://itunes.apple.com/gb/app/sequence-diagram/id1195426709?mt=12
#//# --------------------------------------------------------------------------------------
# fiKks integratie overzicht voor schuldeisers
# Initiate connection
 
participant "fiKks App" 			as AppRP
participant "fiKks back-end" 		as BackEndRP
participant "Schuldeiser" 			as DP
participant "Schuldeiser node"	as NodeDP
participant "Connection #2"		as C2
participant "User node" 			as NodeUser
participant "Connection #1"		as C1
participant "fiKks node"			as NodeRP

region [DP connection]

	activate NodeUser 
	activate NodeRP

	AppRP 		-> NodeUser 	: claim token

	activate C2

	NodeUser	-> C2			: prepare connection
	AppRP 		-> DP 			: reditect (token + returnURL)
	DP 			-> NodeDP 	: connect
	NodeDP 	-> C2 			: connect
	AppRP 		-> BackEndRP	: notification connecton		
end
