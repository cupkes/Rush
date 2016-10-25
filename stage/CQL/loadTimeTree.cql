WITH range(1970, 2016) AS years, range(1,12) as months
FOREACH(year IN years | 
  MERGE (y:Year {year: year})
  FOREACH(month IN months | 
    CREATE (m:Month {month: month})
    MERGE (y)-[:HAS_MONTH]->(m)
    FOREACH(day IN (CASE 
                      WHEN month IN [1,3,5,7,8,10,12] THEN range(1,31) 
                      WHEN month = 2 THEN 
                        CASE
                          WHEN year % 4 <> 0 THEN range(1,28)
                          WHEN year % 100 <> 0 THEN range(1,29)
                          WHEN year % 400 <> 0 THEN range(1,29)
                          ELSE range(1,28)
                        END
                      ELSE range(1,30)
                    END) |      
      CREATE (d:Day {day: day})
      MERGE (m)-[:HAS_DAY]->(d))))
 
WITH *
 
MATCH (year:Year)-[:HAS_MONTH]->(month)-[:HAS_DAY]->(day)
WITH year,month,day
ORDER BY year.year, month.month, day.day
WITH collect(day) as days
FOREACH(i in RANGE(0, length(days)-2) | 
    FOREACH(day1 in [days[i]] | 
        FOREACH(day2 in [days[i+1]] | 
            CREATE UNIQUE (day1)-[:NEXT]->(day2))))