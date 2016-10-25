using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTMEDICATIONS.csv" AS line WITH line
match (rxOrder:RXOrder {ID:line.ORDERID}) match (encounter:Encounter {encounterID:line.ENCOUNTERID})
create (rxOrder)<-[:ENCOMPASSED]-(encounter);