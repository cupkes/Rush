using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTCONDITIONRES.csv" AS line WITH line
match (c:ConditionResolution {ID:line.CONDITIONID + "R"}) match (dx:DX {code:line.CONDITION})
create (dx)<-[:INDICATED]-(c);