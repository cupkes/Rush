using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTDIAGNOSES.csv" AS line WITH line
match (diagnosis:Diagnosis {ID:line.DIAGNOSISID}) match (dx:DX {code:line.DX})
create (diagnosis)-[:INDICATED]->(dx);