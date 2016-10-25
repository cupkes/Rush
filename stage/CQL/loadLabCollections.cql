create constraint on (labCollection:LabCollection) assert labCollection.ID is unique;
using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTLABS.csv" AS line WITH line
create (:LabCollection{ID:line.ORDERID + "C", time:toInt(line.SpecimenTime) });