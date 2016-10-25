#!/bin/bash -e
#!/usr/bin/env NEO4J_HOME
#
# Script for deleting the Rush Graph
# This script is intended to be called
# by a master script.
# Ensure Neo4j is stopped.
###########################################

#exec 1> >(logger -s -t $(basename $0)) 2>&1

# specify the neo4j home and load utility
NEO4J_HOME="/opt/neo4j/neo4j-enterprise-3.0.4"
cd $NEO4J_HOME/data/databases/
tar -zcvf graphdb$(date +%Y%m%d).tar.gz graph.db && rm -rf graph.db/*


