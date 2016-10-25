using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTENCSTARTS.csv" AS line WITH line
MATCH (e:Event{ID:line.ENCOUNTERID + "S"})
MATCH (d:Day) WHERE d.startSeconds <= e.time and d.endSeconds >= e.time
CREATE (e)-[:OCCURRED_ON]->(d);