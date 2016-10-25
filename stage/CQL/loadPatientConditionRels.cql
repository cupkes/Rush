using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTCONDITIONS.csv" AS line WITH line
match (c:Condition {ID:line.CONDITIONID}) match (p:Patient {patientID:line.CAP_ID})
create (c)<-[:SUFFERED]-(p);