MATCH (lo:LabOrder) SET lo:LabEvent;
MATCH (lf:LabFill) SET lf:LabEvent;
MATCH (lr:LabResult) SET lr:LabEvent;
