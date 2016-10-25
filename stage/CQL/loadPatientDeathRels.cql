using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTDEATH.csv" AS line WITH line
match (d:Death {ID:line.id}) match (p:Patient {patientID:line.CAP_ID})
create (p)-[:DIED]->(d) ;
