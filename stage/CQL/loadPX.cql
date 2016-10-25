create constraint on (px:PX) assert px.code is unique;
using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTPROCEDURES.csv" AS line WITH line
merge (:PX {code:line.PX, type:line.RAW_PX_TYPE});
