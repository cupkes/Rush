MATCH (y:Year)-[:HAS_MONTH]->(m:Month)-[:HAS_DAY]->(d:Day)
WHERE y.year > 1969
with d order by ID(d)
with collect(d) as days
FOREACH(i in RANGE(0, size(days)-1) |
	FOREACH (day in [days[i]] |
		set day.startSeconds = (i * 86400), day.endSeconds = (((i + 1) * 86400) -1)));