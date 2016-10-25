using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTCONDITIONS.csv" AS line WITH line
match (c:ConditionOnset {ID:line.CONDITIONID}) match (dx:DX {code:line.CONDITION})
create (dx)<-[:INDICATED]-(c);