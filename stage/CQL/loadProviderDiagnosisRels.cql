using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTPROVDIAGNOSES.csv" AS line WITH line
match (diagnosis:Diagnosis {ID:line.DIAGNOSISID}) match (provider:Provider {ID:line.PROVIDERID})
create (diagnosis)<-[:DIAGNOSED]-(provider);