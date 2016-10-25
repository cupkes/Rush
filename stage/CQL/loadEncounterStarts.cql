create constraint on (start:EncounterStart) assert start.ID is unique;
using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTENCSTARTS.csv" AS line WITH line
create (:EncounterStart{ID:line.ENCOUNTERID + "S", time:toInt(line.AdmitTime),date:line.ADMIT_DATE });