using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTPROCEDURES.csv" AS line WITH line
MATCH (e:Procedure{ID:line.PROCEDURESID})
MATCH (d:Day) WHERE d.startSeconds = e.intTime
CREATE (e)-[:OCCURED_ON]->(d);

using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTCONDITIONRES.csv" AS line WITH line
MATCH (e:ConditionResolution{ID:line.CONDITIONID + "R"})
MATCH (d:Day) WHERE d.startSeconds = e.intTime
CREATE (e)-[:OCCURED_ON]->(d);

using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTDIAGNOSES.csv" AS line WITH line
MATCH (e:Diagnosis{ID:line.DIAGNOSISID})
MATCH (d:Day) WHERE d.startSeconds = e.intTime
CREATE (e)-[:OCCURED_ON]->(d);

using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTMEDICATIONS.csv" AS line WITH line
MATCH (e:RXOrder{ID:line.ORDERID})
MATCH (d:Day) WHERE d.startSeconds = e.intTime
CREATE (e)-[:OCCURED_ON]->(d);

using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTENCENDS.csv" AS line WITH line
MATCH (e:Event{ID:line.EventID + "E"})
MATCH (d:Day) WHERE d.startSeconds <= e.intTime and d.endSeconds >= e.intTime
CREATE (e)-[:OCCURED_ON]->(d);

using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTENCSTARTS.csv" AS line WITH line
MATCH (e:Event{ID:line.EventID + "S"})
MATCH (d:Day) WHERE d.startSeconds <= e.intTime and d.endSeconds >= e.intTime
CREATE (e)-[:OCCURED_ON]->(d);

using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTLABS.csv" AS line WITH line
MATCH (e:Event{ID:orderID:line.ORDERID + "O"})
MATCH (d:Day) WHERE d.startSeconds <= e.intTime and d.endSeconds >= e.intTime
CREATE (e)-[:OCCURED_ON]->(d);

using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTLABS.csv" AS line WITH line
MATCH (e:Event{ID:orderID:line.ORDERID + "F"})
MATCH (d:Day) WHERE d.startSeconds <= e.intTime and d.endSeconds >= e.intTime
CREATE (e)-[:OCCURED_ON]->(d);

using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTLABS.csv" AS line WITH line
MATCH (e:Event{ID:orderID:line.ORDERID + "R"})
MATCH (d:Day) WHERE d.startSeconds <= e.intTime and d.endSeconds >= e.intTime
CREATE (e)-[:OCCURED_ON]->(d);



