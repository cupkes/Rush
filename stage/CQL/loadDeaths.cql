create constraint on (death:Death) assert death.ID is unique;
using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTDEATH.csv" AS line WITH line
create (:Death {ID:line.id,deathDate:line.DEATH_DATE, time:toInt(line.DeathTime)});
