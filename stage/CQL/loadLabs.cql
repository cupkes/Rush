create constraint on (lab:Lab) assert lab.code is unique;
using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTLABS.csv" AS line WITH line
merge (:Lab {code:line.LAB_CODE, labName:line.LAB_NAME})