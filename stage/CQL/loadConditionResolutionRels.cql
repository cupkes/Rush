using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTCONDITIONRES.csv" AS line WITH line
MATCH (cr:ConditionResolution {ID:line.CONDITIONID + "R"})
MATCH (c:Condition {ID:line.CONDITIONID})
CREATE (c)-[:HAD]->(cr);