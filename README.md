# Over fiKks
ADG introduceert middels de ‘Stichting Helden van de Wil’ een technologisch gedreven schaalbaar platform onder de naam fiKks. Dit platform brengt mensen met schulden, gemeenten, bedrijven, schuldeisers en vrijwilligers (‘buddy’s’) bij elkaar. Het gaat om een match tussen burgers. Er is geen bevoogdende, dwingende instantie die meekijkt. Collega’s helpen collega’s, stadgenoten helpen stadgenoten, buddy’s helpen schuldenaren op eigen kracht uit de financiële problemen te komen. FiKks moet mensen in een vroegtijdig stadium hulp bieden, ver voordat de problemen echt uit de hand lopen.

FiKks kent 5 hoofdfuncties:

*  Het matchen van schuldenaar en buddy
*  Het met de buddy online opstellen van het te ‘fiKksen’ dossier
*  Het online organiseren van kostenverlagende en inkomen verhogende maatregelen
*  Via algoritmes bepalen in welke volgorde schulden afbetaald moeten worden aan welke schuldeisers, zodat de minste kosten gemaakt worden.
*  Het online via de app aanvragen, accorderen en uitvoeren van een schuldregeling met schuldeisers. Met schuldeisers zijn vooraf de condities tot accordering besproken zodat deze verwerkt zijn in de app.

Fikks maakt gebruik van het basisuitgangspunt dat een betrokkene recht op inzage heeft in zijn of haar persoonsgegevens en op een kopie van die gegevens in een gangbare elektronische vorm. Voor een schaalbare realisatie van deze gegevensuitwisseling wordt gebruik gemaakt van het Qiy Trust Framework zodat naast schaalbaarheid tevens invulling wordt gegeven aan de in de algemene verordening gegevensbescherming (AVG) opgenomen verplichting van gegevensbescherming door ontwerp (‘data protection by design’).

# Standaard voor gegevensuitwisseling
Gegevensuitwisseling tussen informatiesystemen in het kader van fiKks vindt plaats volgens de de binnen deze repository gedefinieerde standaard. Het aanleverende systeem is verantwoordelijk voor de vertaling van gegevens naar deze standaard. Het afnemende systeem zorgt voor omzetting naar haar eigen taal.

De standaard definieert het formaat voor gestructureerde vastlegging van gegevens en hun betekenis voor medium-onafhankelijke opslag en uitwisseling.

# Git-Flow
Git-Flow is een set van conventions over hoe te werken met Git en wordt toegepast op deze repository. Het definieert de workflows voor de meest voorkomende werkzaamheden - zoals het opnemen van nieuwe functionaliteit, hotfixes of releases. Meer over deze 'branching' strategie en release management, wordt uitgelegd in de blog-post [A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model/).

Conventions used:

* Feature branch prefix: **feature/**
* Topic branch prefix: **topic/**
* Hotfix branch prefix: **hotfix/**
* Release branch prefix: **release/**
