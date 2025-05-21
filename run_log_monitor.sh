#!/bin/bash
 
#CREATED BY    : Abubakar Malik
#MODIFIED BY   : Abubakar Malik
#MODIFIED DATE : 2025/20/05
#SOLUTION      : Log Monitoring Application
 
###################################################### REQUIRED ################################################################
WARNING_THRESHOLD=5
ERROR_THRESHOLD=10
 
LOG_FILE="$1"
if [[ ! -f "$LOG_FILE" ]]; then
  echo "Usage: $0 <logs.log or logs.csv>"
  exit 1
fi
###################################################### REQUIRED ################################################################
 
# Declaring Arrays
declare -A job_timestamps
declare -A job_descriptions
 
while IFS=',' read -r job_timestamp job_desc job_status job_pid; do
# Converting to Epoch so calculation can be easier
  timestamp=$(date -d "$(date +%F) $job_timestamp" +%s)
  job_descriptions["$job_pid"]="$job_desc"
 
# Checking timestamp of START and END jobs status
  if [ $job_status = "START" ]; then
    job_timestamps["$job_pid"]=$timestamp
  elif [ $job_status = "END" ]; then
    starttime=${job_timestamps["$job_pid"]}
    if [[ -z "$starttime" ]]; then
      echo "ERROR: END found without START for $job_pid ($job_desc)"
      continue
    fi
# Converting to minutes and getting final values
    duration=$((timestamp - starttime))
    duration_mins=$((duration / 60))
 
# Displaying output based on job runnings
    if (( duration_mins > $ERROR_THRESHOLD )); then
      echo "ERROR: ${job_descriptions[$job_pid]} ($job_pid) took $duration_mins minutes"
    elif (( duration_mins > $WARNING_THRESHOLD )); then
      echo "WARNING: ${job_descriptions[$job_pid]} ($job_pid) took $duration_mins minutes"
    else
      echo "OK: ${job_descriptions[$job_pid]} ($job_pid) took $duration_mins minutes"
    fi
  fi
done < "$LOG_FILE"
