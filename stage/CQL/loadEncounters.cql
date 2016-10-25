create constraint on (encounter:Encounter) assert encounter.encounterID is unique;
using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTENCOUNTERS.csv" AS line WITH line
create (:Encounter {encounterID:line.ENCOUNTERID, type:line.ENC_TYPE,site:line.RAW_SITE});