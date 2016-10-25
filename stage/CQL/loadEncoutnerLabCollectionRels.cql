using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTLABS.csv" AS line WITH line
match (labCollection:LabCollection {ID:line.ORDERID + "C"}) match (encounter:Encounter {encounterID:line.ENCOUNTERID})
create (labCollection)<-[:ENCOMPASSED]-(encounter);