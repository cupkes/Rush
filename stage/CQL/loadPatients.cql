create constraint on (patient:Patient) assert patient.patientID is unique;
using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTDEMOGRAPHICS.csv" AS line WITH line
create (:Patient {patientID:line.CAP_ID,dob:line.BIRTH_DATE,sex:line.SEX,race:line.RAW_RACE});
