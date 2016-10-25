using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTDEATH.csv" AS line WITH line
MATCH (e:Death {ID:line.id})
MATCH (d:Day) WHERE d.startSeconds <= e.time and d.endSeconds >= e.time
CREATE (e)-[:OCCURED_ON]->(d);