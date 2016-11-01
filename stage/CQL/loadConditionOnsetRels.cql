using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTCONDITIONS.csv" AS line WITH line
MATCH (co:ConditionOnset {ID:line.CONDITIONID + "O"})
MATCH (c:Condition {ID:line.CONDITIONID})
CREATE (c)-[:HAD]->(co);