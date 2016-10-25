create constraint on (labResult:LabResult) assert labResult.ID is unique;
using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTLABS.csv" AS line WITH line
create (:LabResult{ID:line.ORDERID + "R", time:toInt(line.ResultTime) });