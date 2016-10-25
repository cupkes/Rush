create constraint on (rxOrder:RXOrder) assert rxOrder.ID is unique;
using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTMEDICATIONS.csv" AS line WITH line
create (:RXOrder {ID:line.ORDERID, time:toInt(line.OrderTime), route:line.ROUTE, frequency:line.FREQUENCY_VALUE,
frequencyUnit:line.FREQUENCY_UNIT });
