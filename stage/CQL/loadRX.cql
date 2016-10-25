create constraint on (rx:RX) assert rx.code is unique;
using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTMEDICATIONS.csv" AS line WITH line
merge (:RX {code:line.MEDICATION_CODE, medication:line.MEDICATION});
