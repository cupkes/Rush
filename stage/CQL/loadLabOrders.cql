create constraint on (labOrder:LabOrder) assert labOrder.ID is unique;
using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTLABS.csv" AS line WITH line
create (:LabOrder{ID:line.ORDERID + "O", time:toInt(line.OrderTime) });