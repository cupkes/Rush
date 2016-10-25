MATCH (y:Year)-[:HAS_MONTH]->(m:Month)-[:HAS_DAY]-(d:Day)
WHERE y.year > 1969
with d order by d.ID()
with collect(d) as days
FOREACH(i in RANGE(0, size(days)-1) |
	set d.startTime = (i * 86400), d.endTime = (((i + 1) * 86400) -1))

	
	