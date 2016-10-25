using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTDIAGNOSES.csv" AS line WITH line
match (diagnosis:Diagnosis {ID:line.DIAGNOSISID}) match (encounter:Encounter {encounterID:line.ENCOUNTERID})
create (diagnosis)<-[:ENCOMPASSED]-(encounter);