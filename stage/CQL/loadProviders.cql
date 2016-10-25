create constraint on (provider:Provider) assert provider.ID is unique;
using periodic commit 1000 LOAD CSV WITH HEADERS FROM "file:///UHEP10PTPROVIDERS.csv" AS line WITH line
merge (:Provider {ID:line.PROVIDERID});
