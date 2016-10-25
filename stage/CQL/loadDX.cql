create constraint on (dx:DX) assert dx.code is unique;
using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTDIAGNOSES.csv" AS line WITH line
merge (:DX {code:line.DX, type:line.RAW_DX_TYPE});
