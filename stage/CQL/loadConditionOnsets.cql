create constraint on (conditionOnset:ConditionOnset) assert conditionOnset.ID is unique;
using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTCONDITIONS.csv" AS line WITH line
create (:ConditionOnset {ID:line.CONDITIONID + "O", onsetDate:line.ONSET_DATE, time:toInt(line.OnsetTime)});