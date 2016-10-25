create constraint on (labRequest:LabRequest) assert labRequest.ID is unique;
using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTLABS.csv" AS line WITH line
create (:LabRequest{ID:line.LAB_RESULT_CM_ID, labRequest:line.ORDERID,labName:line.LAB_NAME,
labResult:line.TESTVALUE, labNumeric:line.VALUE_NUMERIC, labResultUnit:line.UNIT });