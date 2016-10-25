using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTLABS.csv" AS line WITH line
match (labRequest {ID:line.LAB_RESULT_CM_ID}) match (labFill:LabFill {orderID:line.ORDERID})
create (labRequest)-[:HAD]->(labFill);