#//# --------------------------------------------------------------------------------------
#//# Created using websequencediagrams.com
#//# --------------------------------------------------------------------------------------
# fiKks integratie overzicht voor schuldeisers

title Verbinding nodes Betrokkene en Schuldeiser
 
participant "fiKks App"         as AppRP
participant "User node"         as NodeUser
participant "Qiy Trust Network" as QTN
participant "Schuldeiser node"  as NodeDP
participant "Schuldeiser"       as DP


    AppRP    ->  DP       : redirect (return_url)
    DP       ->  NodeDP   : get token
    NodeDP   ->  QTN      : get token
    QTN      --> NodeDP   : token
    NodeDP   --> DP       : token
    DP       ->  AppRP    : return (token)
    AppRP    ->  NodeUser : connect
    NodeUser ->  QTN      : connect
    QTN      ->  NodeDP   : notify connection
    NodeDP   ->  DP       : notify connection


