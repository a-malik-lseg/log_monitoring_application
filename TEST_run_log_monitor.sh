#!/bin/bash
 
SCRIPT_OUTPUT=$(./run_log_monitor.sh logs.log)
 
echo "$SCRIPT_OUTPUT" | grep -q "OK: scheduled task 032 (37980) took" && echo "OK Test passed" || echo "OK Test failed"
echo "$SCRIPT_OUTPUT" | grep -q "ERROR: scheduled task 004" && echo "ERROR test passed" || echo "ERROR test failed"
echo "$SCRIPT_OUTPUT" | grep -q "WARNING:" && echo "Warning test passed" || echo "Warning Test failed"
