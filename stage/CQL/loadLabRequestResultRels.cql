using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTLABS.csv" AS line WITH line
match (labRequest:LabRequest {ID:line.LAB_RESULT_CM_ID}) match (labResult:LabResult {ID:line.LABRESULTID})
create (labRequest)-[:HAD]->(labResult);