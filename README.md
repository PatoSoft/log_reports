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

## Installing Ruby

### Windows

There's an installer, it's easy.
http://rubyinstaller.org/

### Mac

Newer macs ship with a usable version of Ruby.

Try `ruby -v` in a terminal window, and if it's 2.x you're fine.

http://www.railstutorial.org/book/beginning#sec-install_ruby
http://tutorials.jumpstartlab.com/topics/environment/environment.html
http://docs.railsbridge.org/installfest/macintosh

### Linux

Ubuntu: http://docs.railsbridge.org/installfest/linux
https://www.ruby-lang.org/en/installation/