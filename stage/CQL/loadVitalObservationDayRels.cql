using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTVITALS.csv" AS line WITH line
MATCH (e:VitalObservation {ID:line.VITALID})
MATCH (d:Day) WHERE d.startSeconds <= e.intTime and d.endSeconds >= e.intTime
CREATE (e)-[:OCCURRED_ON]->(d);