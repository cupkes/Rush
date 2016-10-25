// set encounter indicator events
MATCH (es:EncounterStart) set es:FirstEncounterEvent;
MATCH (ee:EncounterEnd) set ee:LastEncounterEvent;
//
MATCH (e:Encounter)-[:ENCOMPASSED]-(ev:Event) 
with e, ev order by ev.time desc
with e, collect(ev) [..1] as lastEvent
unwind lastEvent as ev
SET ev:LastEncounterEvent;
//
// set patient inidicator events
//
MATCH (p:Patient)-[*2]->(ev:Event)
with p, ev order by ev.time asc
with p, collect(ev) [..1] as firstEvent
unwind firstEvent as ev
set ev:FirstPatientEvent;
//
MATCH (p:Patient)-[*2]->(ev:Event)
with p, ev order by ev.time desc
with p, collect(ev) [..1] as lastEvent
unwind lastEvent as ev
set ev:lastPatientEvent;
//
MATCH (d:Death) set d:LastPatientEvent;
