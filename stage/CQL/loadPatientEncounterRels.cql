using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTENCOUNTERS.csv" AS line WITH line
match (p:Patient {patientID:line.CAP_ID}) match (e:Encounter {encounterID:line.ENCOUNTERID})
create (p)-[:ENCOUNTERED]->(e);