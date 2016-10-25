using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTPROCEDURES.csv" AS line WITH line
MATCH (e:Procedure{ID:line.PROCEDURESID})
MATCH (d:Day) WHERE d.startSeconds = e.time
CREATE (e)-[:OCCURRED_ON]->(d);