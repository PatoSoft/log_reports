# frozen_string_literal: true

module LogReports
  # Parses the log file to a WebpagesInfo Object
  class LogParser
    def self.parse(log_path)
      new(log_path).to_webpages_info
    end

    def initialize(log_path)
      @log_path = log_path
    end

    def to_webpages_info
      WebpagesInfo.new(parse_file)
    end

    private

    attr_reader :log_path

    def parse_file
      validate_log_file
      log_to_webpages
    end

    def log_to_webpages
      File.foreach(log_path).with_object(log_line_object) do |log_line, hash|
        add_webpage(log_line, hash)
      end.values
    end

    def add_webpage(log_line, hash)
      # We remove '\n' and split the line in page and the ip_address of the visit
      url, visit_ip = format_log_line(log_line)

      # We use downcase because for us '/about' and '/aBoUt' are the same page
      # We consider '/about/...' as a different page
      hash[url.downcase].add_visit_ip(visit_ip)
    end

    def log_line_object
      Hash.new { |hash, key| hash[key] = WebpageInfo.new(key) }
    end

    def format_log_line(log_line)
      log_line[0..-2].split
    end

    def validate_log_file
      raise 'ERROR: Log file does not exist!' unless File.exist? log_path
    end
  end
end
