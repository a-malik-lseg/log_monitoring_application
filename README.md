# log_monitoring_application
A log monitoring application reads the file, measures how long each job takes from start to finish and then outputs the results based on the thresholds set.
## Prerequisites
The solution is designed for Linux based systems. For other systems like Windows, Mac necessary changes are required to be made to make it work.
Nothing needs to be installed in Linux.
## Content
There are four files;
- _TEST_run_log_monitor.sh_ - This is the test script to check main script
- _run_log_monitor.sh_ - This is main script which you need to run to see output of the program
- _logs.log_ - This is the input raw data on which main script works
- _output.csv_ - This is the output of the script
## Run the test
```
./TEST_run_log_monitor.sh OR sh TEST_run_log_monitor.sh
```
## Run the main script to check job status
```
./run_log_monitor.sh logs.log OR sh run_log_monitor.sh logs.log
```
