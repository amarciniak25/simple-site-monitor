# simple-site-monitor
A simple Ruby script to pull a URL, search for a string, and log the result to a CSV file.

## Usage
ruby simple-site-monitor.rb --site=*URL* --pattern=*pattern* --log=*log-file*

### Example
ruby simple-site-monitor.rb --site=https://google.com --pattern=body --log=log.csv

## Scheduling
I use a cron job to run the program every five min.

### Example cron Line
*/5 * * * * ruby ~/simple-site-monitor/simple-site-monitor.rb --site=https://google.com --pattern=body --log=google.csv

## Background
We needed a method for monitoring uptime of a mission critical app that is hosted on the internal network. Uptime monitoting services would not work because the app is only accessable from the inside.