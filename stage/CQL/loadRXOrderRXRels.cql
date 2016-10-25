using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTMEDICATIONS.csv" AS line WITH line
match (rxOrder:RXOrder {ID:line.ORDERID}) match (rx:RX {code:line.MEDICATION_CODE})
create (rxOrder)-[:ORDERED]->(rx);