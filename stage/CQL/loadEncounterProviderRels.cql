using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTENCPROVS.csv" AS line WITH line
match (encounter:Encounter {encounterID:line.ENCOUNTERID}) match (provider:Provider {ID:line.PROVIDERID})
create (encounter)-[:REQUIRED]->(provider);