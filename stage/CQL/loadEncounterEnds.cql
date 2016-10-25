create constraint on (end:EncounterEnd) assert end.ID is unique;
using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTENCENDS.csv" AS line WITH line
create (:EncounterEnd{ID:line.ENCOUNTERID + "E", time:toInt(line.DischargeTime),date:line.DISCHARGE_DATE });