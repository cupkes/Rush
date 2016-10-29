#!/bin/bash -e
#!/usr/bin/env NEO4J_HOME
#
# Script for loading Rush Graph
# This script is intended to be called
# by a master script.
###########################################
# This script uses the neo4j shell utility
# and .cql files to invoke the LOAD CSV
# functionality built into Neo4j.
# To inspect the cypher being used in each
# step of the load process, review each
# named .cql file.  I used separate .cql
# files for each stage to avoid confusion
# regarding which query was associated with
# which step and to make the debugging process
# easier.
###########################################
#exec 1> >(logger -s -t $(basename $0)) 2>&1

# specify the neo4j home and load utility
NEO4J_HOME="/opt/neo4j/neo4j-enterprise-3.0.4"
CMD="$NEO4J_HOME/bin/neo4j-shell -file"
MSG="EXECUTING SCRIPT:"
#---------------------------------------------------------
# We begin by loading non-instance, singleton nodes.
#
# 1.  Patients
# 2.  Providers
# 3.  Diagnosis Codes (DX)
# 4.  Medication Codes (RX)
# 5.  Procedure Codes (PX)
# 6.  Labs
# 7.  Timeline (Years, Months, Days)
# 
#---------------------------------------------------------
# LOADING Patients
echo "$MSG loadPatients.cql"
$CMD /opt/neo4j/stage/CQL/loadPatients.cql
sleep 10 # waiting for indexes to build
# LOADING Providers
echo "$MSG lloadProviders.cql"
$CMD /opt/neo4j/stage/CQL/loadProviders.cql
sleep 10 # waiting for indexes to build
# LOADING Diagnosis Codes
echo "$MSG loadDX.cql"
$CMD /opt/neo4j/stage/CQL/loadDX.cql
sleep 10 # waiting for indexes to build
# LOADING Medication Codes
echo "$MSG loadRX.cql"
$CMD /opt/neo4j/stage/CQL/loadRX.cql
sleep 10 # waiting for indexes to build
# LOADING Procedure Codes
echo "$MSG loadPX.cql"
$CMD /opt/neo4j/stage/CQL/loadPX.cql
sleep 10 # waiting for indexes to build
# LOADING Labs
echo "$MSG loadLabs.cql"
$CMD /opt/neo4j/stage/CQL/loadLabs.cql
sleep 10 # waiting for indexes to build
# LOADING Timeline
echo "$MSG loadTimeTree.cql"
$CMD /opt/neo4j/stage/CQL/loadTimeTree.cql
sleep 10 # waiting for indexes to build
# LOADING Timeline Seconds
echo "$MSG loadTimeTreeSeconds.cql"
$CMD /opt/neo4j/stage/CQL/loadTimeTreeSeconds.cql
sleep 10 # waiting for indexes to build
#---------------------------------------------------------
# Next, we load instance type nodes
#
# 1.  Encounters
# 2.  Conditions
# 3.  Lab Requests
# 
#---------------------------------------------------------
# LOADING Encounters
echo "$MSG loadEncounters.cql"
$CMD /opt/neo4j/stage/CQL/loadEncounters.cql
sleep 30 # waiting for indexes to build
# LOADING Conditions
echo "$MSG loadConditions.cql"
$CMD /opt/neo4j/stage/CQL/loadConditions.cql
sleep 30 # waiting for indexes to build
# LOADING Lab Requests
echo "$MSG loadLabRequests.cql"
$CMD /opt/neo4j/stage/CQL/loadLabRequests.cql
sleep 30 # waiting for indexes to build
#---------------------------------------------------------
# Next, we load event nodes
# 
# 1.  Condition Onsets
# 2.  Condition Resolutions
# 3.  Deaths
# 4.  Diagnoses
# 5.  Encounter Starts
# 6.  Encounter Ends
# 7.  Lab Orders
# 8.  Lab Collections
# 9.  Lab Results
# 10. Procedures
# 11. Medication Orders (RX)
# 12. Vital Observations (Vitals)
# 
#--------------------------------------------------------- 
# LOADING Condition Onsets
echo "$MSG loadConditionOnsets.cql"
$CMD /opt/neo4j/stage/CQL/loadConditionOnsets.cql
sleep 30 # waiting for indexes to build
# LOADING Condition Resolutions
echo "$MSG loadConditionResolutions.cql"
$CMD /opt/neo4j/stage/CQL/loadConditionResolutions.cql
sleep 30 # waiting for indexes to build
# LOADING Deaths
echo "$MSG loadDeaths.cql"
$CMD /opt/neo4j/stage/CQL/loadDeaths.cql
sleep 30 # waiting for indexes to build
# LOADING Diagnoses
echo "$MSG loadDiagnoses.cql"
$CMD /opt/neo4j/stage/CQL/loadDiagnoses.cql
sleep 30 # waiting for indexes to build
# LOADING Encounter Starts
echo "$MSG loadEncounterStarts.cql"
$CMD /opt/neo4j/stage/CQL/loadEncounterStarts.cql
sleep 30 # waiting for indexes to build
# LOADING Encounter Ends
echo "$MSG loadEncounterEnds.cql"
$CMD /opt/neo4j/stage/CQL/loadEncounterEnds.cql
sleep 30 # waiting for indexes to build
# LOADING Lab Orders
echo "$MSG loadLabOrders.cql"
$CMD /opt/neo4j/stage/CQL/loadLabOrders.cql
sleep 30 # waiting for indexes to build
# LOADING Lab Collections
echo "$MSG loadCollections.cql"
$CMD /opt/neo4j/stage/CQL/loadCollections.cql
sleep 30 # waiting for indexes to build
# LOADING Lab Results
echo "$MSG loadLabResults.cql"
$CMD /opt/neo4j/stage/CQL/loadLabResults.cql
sleep 30 # waiting for indexes to build
# LOADING Procedures
echo "$MSG loadProcedures.cql"
$CMD /opt/neo4j/stage/CQL/loadProcedures.cql
sleep 30 # waiting for indexes to build
# LOADING Medication Orders
echo "$MSG loadRXOrders.cql"
$CMD /opt/neo4j/stage/CQL/loadRXOrders.cql
sleep 30 # waiting for indexes to build
# LOADING Vital Observations 
echo "$MSG loadVitals.cql"
$CMD /opt/neo4j/stage/CQL/loadVitals.cql
sleep 30 # waiting for indexes to build
#---------------------------------------------------------
# Next we load the event label hiearchy
#
# 1.  Events
# 2.  Condition Events
# 3.  Encounter Events
# 4.  Lab Events
#
#---------------------------------------------------------
# LOADING Event Label Hierarchy
echo "$MSG loadEventLabelHierarchy.cql"
$CMD /opt/neo4j/stage/CQL/loadEventLabelHierarchy.cql
#---------------------------------------------------------
# Next we load the relationships
# 1.  Patient encountered an Encounter
# 2.  Encounter required a Provider
# 3.  Encounter encompassed a Diagnosis
# 4.  Encounter encompassed a Vital Observation
# 5.  Encounter encompassed a Lab Order
# 5.  Encounter encompassed a Lab Collection
# 6.  Encounter encompassed a Lab Result
# 7.  Encounter encompassed an RX Order
# 8.  Encounter encompassed an Encounter Start
# 9.  Encounter encompassed an Encounter End
# 10. Encounter encompassed a Procedure
# 11. Patient suffered a Condition
# 12. Patient died
# 13. Diagnosis indicated a DX Code
# 14. Condition indicated a DX Code
# 15. Procedure performed a PX Code
# 16. Provider provided a Procedure
# 17. Provider diagnosed a Diagnosis
# 18. RX Order ordered an RX Code
# 19. Lab Request requested a Lab
# 20. Lab Request had a Lab Order
# 21. Lab Request had a Lab Collection
# 22. Lab Request had a Lab Result
# 23. Condition had a Condition Onset
# 24. Condition had a Condition Resolution
#
#---------------------------------------------------------
# LOADING Patient to Encounter Relationships
echo "$MSG loadPatientEncounterRels.cql"
$CMD /opt/neo4j/stage/CQL/loadPatientEncounterRels.cql
# LOADING Encounter to Provider Relationships
echo "$MSG loadEncounterProviderRels.cql"
$CMD /opt/neo4j/stage/CQL/loadEncounterProviderRels.cql
# LOADING Encounter to Diagnosis Relationships
echo "$MSG loadEncounterDiagnosisRels.cql"
$CMD /opt/neo4j/stage/CQL/loadEncounterDiagnosisRels.cql
# LOADING Encounter to Vital Observation Relationships
echo "$MSG loadEncounterVitalRels.cql"
$CMD /opt/neo4j/stage/CQL/loadEncounterVitalRels.cql
# LOADING Encounter to Lab Orders
echo "$MSG loadEncounterLabOrderRels.cql"
$CMD /opt/neo4j/stage/CQL/loadEncounterLabOrderRels.cql
# LOADING Encounter to Lab Collections
echo "$MSG loadEncounterLabCollectionRels.cql"
$CMD /opt/neo4j/stage/CQL/loadEncounterLabCollectionRels.cql
# LOADING Encounter to Lab Results
echo "$MSG loadEncounterLabResultRels.cql"
$CMD /opt/neo4j/stage/CQL/loadEncounterLabResultRels.cql
# LOADING Encounter to RX Orders
echo "$MSG loadEncounterRXOrderRels.cql"
$CMD /opt/neo4j/stage/CQL/loadEncounterRXOrderRels.cql
# LOADING Encounter to RX Orders
echo "$MSG loadEncounterStartsRels.cql"
$CMD /opt/neo4j/stage/CQL/loadEncounterStartsRels.cql
# LOADING Encounter to RX Orders
echo "$MSG loadEncounterEndsRels.cql"
$CMD /opt/neo4j/stage/CQL/loadEncounterEndsRels.cql
# LOADING Encounter to Procedures
echo "$MSG loadProcedureEncounterRels.cql"
$CMD /opt/neo4j/stage/CQL/loadProcedureEncounterRels.cql
# LOADING Patient to Condition
echo "$MSG loadPatientConditionRels.cql"
$CMD /opt/neo4j/stage/CQL/loadPatientConditionRels.cql
# LOADING Patient to Deaths
echo "$MSG loadPatientDeathRels.cql"
$CMD /opt/neo4j/stage/CQL/loadPatientDeathRels.cql
# LOADING Diagnosis to DX Codes
echo "$MSG loadDiagnosisDXRels.cql"
$CMD /opt/neo4j/stage/CQL/loadDiagnosisDXRels.cql
# LOADING Condition to DX Codes
echo "$MSG loadConditionDXRels.cql"
$CMD /opt/neo4j/stage/CQL/loadConditionDXRels.cql
# LOADING Procedure to PX Codes
echo "$MSG loadProcedurePXRels.cql"
$CMD /opt/neo4j/stage/CQL/loadProcedurePXRels.cql
# LOADING Provider to Procedure
echo "$MSG loadProviderProcedureRels.cql"
$CMD /opt/neo4j/stage/CQL/loadProviderProcedureRels.cql
# LOADING Provider to Diagnosis
echo "$MSG loadProviderDiagnosisRels.cql"
$CMD /opt/neo4j/stage/CQL/loadProviderDiagnosisRels.cql
# LOADING RX Order to RX Codes
echo "$MSG loadRXOrderRXRels.cql"
$CMD /opt/neo4j/stage/CQL/loadRXOrderRXRels.cql
# LOADING Lab Request to Labs
echo "$MSG loadLabRequestLabRels.cql"
$CMD /opt/neo4j/stage/CQL/loadLabRequestLabRels.cql
# LOADING Lab Request to Lab Orders
echo "$MSG loadRequestOrderRels.cql"
$CMD /opt/neo4j/stage/CQL/loadRequestOrderRels.cql
# LOADING Lab Request to Lab Collections
echo "$MSG loadLabRequestCollectionRels.cql"
$CMD /opt/neo4j/stage/CQL/loadLabRequestCollectionRels.cql
# LOADING Lab Request to Lab Results
echo "$MSG loadRequestResultRels.cql"
$CMD /opt/neo4j/stage/CQL/loadRequestResultRels.cql
# LOADING Condition to Condition Onsets
echo "$MSG loadConditionOnsetRels.cql"
$CMD /opt/neo4j/stage/CQL/loadConditionOnsetRels.cql
# LOADING Condition to Condition Resolutions
echo "$MSG loadConditionResolutionRels.cql"
$CMD /opt/neo4j/stage/CQL/loadConditionResolutionRels.cql


#---------------------------------------------------------
# Next we load the indicator event labels
#
# 1.  First Encounter Events
# 2.  Last Encounter Events
# 3.  First Patient Events
# 4.  Last Patient Events
#
#---------------------------------------------------------
# LOADING Indicator Event Labels
echo "$MSG loadIndicatorEventLabels.cql"
$CMD /opt/neo4j/stage/CQL/loadIndicatorEventLabels.cql

#---------------------------------------------------------
# Next we link patient time events
#
# 1.  First event..next event..last event
#
#---------------------------------------------------------
# LOADING Next Event Relationships
echo "$MSG loadNextEventRels.cql"
$CMD /opt/neo4j/stage/CQL/loadNextEventRels.cql

#---------------------------------------------------------
# Finally we link our timed chain of events to our time tree
#
# 1.  Add seconds since Jan 1, 1970
# 2.  Procedure occurred on Day
# 3.  Condition Onset occurred on Day
# 4.  Condition Resolution occurred on Day
# 5.  Diagnosis occurred on Day
# 6.  RX Order occurred on Day
# 7.  Encounter Start occurred on Day
# 8.  Encounter End occurred on Day
# 9.  Lab Order occurred on Day
# 10. Lab Collection occurred on Day
# 11. Lab Result occurred on Day
# 12. Vital Observation occurred on Day
# 13. Death occurred on Day
#
#---------------------------------------------------------
# LOADING Date start and end in seconds since Jan 1st, 1970
echo "$MSG loadDayStartAndEndSeconds.cql"
$CMD /opt/neo4j/stage/CQL/loadDayStartAndEndSeconds.cql
sleep 30 # waiting for indexes to build
# LOADING Procedure to Day Relationships
echo "$MSG loadProcedureDayRels.cql"
$CMD /opt/neo4j/stage/CQL/loadProcedureDayRels.cql
# LOADING Condition Onset to Dday Relationships
echo "$MSG loadConditionOnsetDayRels.cql"
$CMD /opt/neo4j/stage/CQL/loadConditionOnsetDayRels.cql
# LOADING Condition Resolution to Day Relationships
echo "$MSG loadConditionResolutionDayRels.cql"
$CMD /opt/neo4j/stage/CQL/loadConditionResolutionDayRels.cql
# LOADING RXOrder to Day Relationships
echo "$MSG loadRXOrderDayRels.cql"
$CMD /opt/neo4j/stage/CQL/loadRXOrderDayRels.cql
# LOADING Encounter Start to Day Relationships
echo "$MSG loadEncounterStartDayRels.cql"
$CMD /opt/neo4j/stage/CQL/loadEncounterStartDayRels.cql
# LOADING Encounter End to Day Relationships
echo "$MSG loadEncounterEndDayRels.cql"
$CMD /opt/neo4j/stage/CQL/loadEncounterEndDayRels.cql
# LOADING Lab Order to Day Relationships
echo "$MSG loadLabOrderDayRels.cql"
$CMD /opt/neo4j/stage/CQL/loadLabOrderDayRels.cql
# LOADING Lab Collection to Day Relationships
echo "$MSG loadLabCollectionDayRels.cql"
$CMD /opt/neo4j/stage/CQL/loadLabCollectionDayRels.cql
# LOADING Lab Result to Day Relationships
echo "$MSG loadLabResultDayRels.cql"
$CMD /opt/neo4j/stage/CQL/loadLabResultDayRels.cql
# LOADING Lab Collection to Day Relationships
echo "$MSG loadLabCollectionDayRels.cql"
$CMD /opt/neo4j/stage/CQL/loadLabCollectionDayRels.cql
# LOADING Lab Result to Day Relationships
echo "$MSG loadLabResultDayRels.cql"
$CMD /opt/neo4j/stage/CQL/loadLabResultDayRels.cql
# LOADING Lab Vital Observation to Day Relationships
echo "$MSG loadLabCollectionDayRels.cql"
$CMD /opt/neo4j/stage/CQL/loadLabCollectionDayRels.cql
# LOADING Lab Death to Day Relationships
echo "$MSG loadDeathDayRels.cql"
$CMD /opt/neo4j/stage/CQL/loadDeathDayRels.cql