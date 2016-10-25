using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTPROCEDURES.csv" AS line WITH line
match (procedure:Procedure {ID:line.PROCEDURESID}) match (px:PX {code:line.PX})
create (procedure)-[:PERFORMED]->(px);