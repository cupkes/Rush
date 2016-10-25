create constraint on (diagnosis:Diagnosis) assert diagnosis.ID is unique;
using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTDIAGNOSES.csv" AS line WITH line
create (:Diagnosis {ID:line.DIAGNOSISID, time:toInt(line.DiagnosisTime)});