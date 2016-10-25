using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTCONDITIONRES.csv" AS line WITH line
MATCH (e:ConditionResolution{ID:line.CONDITIONID + "R"})
MATCH (d:Day) WHERE d.startSeconds = e.time
CREATE (e)-[:OCCURRED_ON]->(d);