using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTDIAGNOSES.csv" AS line WITH line
MATCH (e:Diagnosis{ID:line.DIAGNOSISID})
MATCH (d:Day) WHERE d.startSeconds <= e.time and d.endSeconds >= e.time
CREATE (e)-[:OCCURRED_ON]->(d);