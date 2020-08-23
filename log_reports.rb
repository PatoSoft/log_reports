# frozen_string_literal: true

require_relative 'lib/log_reports'

if ARGV.length != 1
  puts 'Error: We expect only 1 argument (the log path)'
  exit
end

log_path = ARGV[0]
webpages_info = LogReports::LogParser.parse(log_path)
log_report = LogReports::LogReport.new(webpages_info)

log_report.visits_desc_report
log_report.unique_visits_desc_report
