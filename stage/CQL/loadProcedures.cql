create constraint on (procedure:Procedure) assert procedure.ID is unique;
using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTPROCEDURES.csv" AS line WITH line
create (:Procedure{ID:line.PROCEDURESID, time:toInt(line.ProcedureTime) });
