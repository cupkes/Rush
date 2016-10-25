create constraint on (condition:Condition) assert condition.ID is unique;
using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTCONDITIONS.csv" AS line WITH line
create (:Condition {ID:line.CONDITIONID, status:line.RAW_CONDITION_STATUS});