using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTVITALS.csv" AS line WITH line
match (vitalObs:VitalObservation {ID:line.VITALID}) match (encounter:Encounter {encounterID:line.ENCOUNTERID})
create (vitalObs)<-[:ENCOMPASSED]-(encounter);