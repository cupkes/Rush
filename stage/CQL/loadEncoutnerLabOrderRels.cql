using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTLABS.csv" AS line WITH line
match (labOrder:LabOrder {orderID:line.ORDERID}) match (encounter:Encounter {encounterID:line.ENCOUNTERID})
create (labOrder)<-[:ENCOMPASSED]-(encounter);