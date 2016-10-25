using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTPROVPROCS.csv" AS line WITH line
match (provider:Provider {ID:line.PROVIDERID}) match (procedure:Procedure {ID:line.PROCEDURESID})
create (provider)-[:PROVIDED]->(procedure);