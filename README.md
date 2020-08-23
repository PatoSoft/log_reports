# Log Reports
Ruby script that receives a log file with information about visits to webpages and returns reports about this information.
Current reports available:
* Webpages with most page views
* Webpages with most unique page views

# Usage
```
ruby log_reports.rb data/webserver.log
```

# Running the tests
Installing dependencies (only the first time):
```
bundle
```

For running the entire test suite:
```
rspec spec
```