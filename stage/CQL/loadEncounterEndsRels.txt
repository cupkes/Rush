using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTENCSTARTS.csv" AS line WITH line
match (encounterEnd:EncounterEnd{ID:line.ENCOUNTERID + "E"}) match (encounter:Encounter {encounterID:line.ENCOUNTERID})
create (encounterStart)<-[:ENCOMPASSED]-(encounter);