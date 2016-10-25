create constraint on (conditionResolution:ConditionResolution) assert conditionResolution.ID is unique;
using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTCONDITIONRES.csv" AS line WITH line
create (:ConditionResolution {ID:line.CONDITIONID + "R", onsetDate:line.RESOLVE_DATE, time:toInt(line.ResolveTime)});