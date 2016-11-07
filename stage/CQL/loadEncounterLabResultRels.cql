using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTLABS.csv" AS line WITH line
match (labResult:LabResult {ID:line.RESULTID}) match (encounter:Encounter {encounterID:line.ENCOUNTERID})
create (labResult)<-[:ENCOMPASSED]-(encounter);