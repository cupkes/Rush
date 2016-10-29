###########################################
#
# This script calls two other scripts
# 1.  deleteGraphDB.sh which basically
#	  deletes all nodes and relationships and
#	  drops all indexes.
# 2.  autoLoadRushGraph.sh which loads all
#     Metadata Management nodes and their
#     relationships.
#
###########################################	  
# redirect stdout and stderr to logger
exec 1> >(logger -s -t $(basename $0)) 2>&1
NEO_HOME="/opt/neo4j/neo4j-enterprise-3.0.4"
cd $NEO_HOME/bin
./neo4j stop
sleep 30
# delete existing graph data
./opt/neo4j_support/etc/deleteGraphDB.sh
./neo4j start
sleep 30
# load Rush graph
./opt/neo4j_support/etc/loadRushGraph.sh


