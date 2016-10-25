using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTCONDITIONS.csv" AS line WITH line
MATCH (e:ConditionOnset{ID:line.CONDITIONID + "O"})
MATCH (d:Day) WHERE d.startSeconds = e.time
CREATE (e)-[:OCCURRED_ON]->(d);