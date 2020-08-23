# frozen_string_literal: true

module LogReports
  # Information about visits made to a webpage
  class WebpageInfo
    attr_reader :url, :visit_ips

    def initialize(url, visit_ips = [])
      @url = url
      @visit_ips = visit_ips
    end

    def add_visit_ip(visit_ip)
      visit_ips << visit_ip
    end

    def visit_amount
      visit_ips.size
    end

    def unique_visit_amount
      unique_visit_ips.size
    end

    def unique_visit_ips
      visit_ips.uniq
    end

    def to_h
      {
        url: url,
        visit_amount: visit_amount,
        unique_visit_amount: unique_visit_amount
      }
    end
  end
end
