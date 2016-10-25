using periodic commit 100 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTDEMOGRAPHICS.csv" AS line WITH line
MATCH (:Patient {patientID:line.CAP_ID})-[*2]->(ev:Event)
with ev order by ev.time asc
with collect(ev) as eventTimes
FOREACH(i in RANGE(0, size(eventTimes)-2) | 
    FOREACH(priorEvent in [eventTimes[i]] | 
        FOREACH(latterEvent in [eventTimes[i+1]] | 
            CREATE UNIQUE (priorEvent)-[:NEXT]->(latterEvent))));
			