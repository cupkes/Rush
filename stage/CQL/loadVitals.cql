create constraint on (vitalobs:VitalObservation) assert vitalobs.ID is unique;
using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTVITALS.csv" AS line WITH line
create (:VitalObservation {ID:line.VITALID, type:line.OBSERVATION_TYPE, result:line.OBSERVATION,
time:toInt(line.VitalTime)});