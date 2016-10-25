using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTMEDICATIONS.csv" AS line WITH line
MATCH (e:RXOrder{ID:line.ORDERID})
MATCH (d:Day) WHERE d.startSeconds <= e.time and d.endSeconds >= e.time
CREATE (e)-[:OCCURRED_ON]->(d);