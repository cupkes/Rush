using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTPROCEDURES.csv" AS line WITH line
match (procedure:Procedure {ID:line.PROCEDURESID}) match (encounter:Encounter {encounterID:line.ENCOUNTERID})
create (procedure)<-[:ENCOMPASSED]-(encounter);