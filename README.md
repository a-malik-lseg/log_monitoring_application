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
If you want to get output in a file use below one of the below commmands;
```
./run_log_monitor.sh logs.log > output.csv OR sh run_log_monitor.sh logs.log > output.csv
```
## Future Improvements
- I would like to use Python as it's much broader and has many ways to do the same thing. If the requirements get more complicated Python is better to handle the complexity 
- Automate the script deployment using Ansible > Jenkins combination
- For Cloud schedule a lambda to run
- The documentation took quite some time as it's important to write in such a way that it's clear and easily understandable to people who know nothing about the programming
