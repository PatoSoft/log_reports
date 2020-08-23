# frozen_string_literal: true

module LogReports
  # Print reports using WebpagesInfo data
  class LogReport
    def initialize(webpages_info)
      @webpages_info = webpages_info
    end

    def visits_desc_report
      puts "\n* Webpages with most page views:\n" +
      visits_desc_formatted.join("\n")
    end

    def unique_visits_desc_report
      puts "\n* Webpages with most unique page views:\n" +
      unique_visits_desc_formatted.join("\n")
    end

    private

    attr_reader :webpages_info

    def visits_desc_formatted
      visits_desc_info.map do |hash|
        visits_desc_template(hash[:url], hash[:visit_amount])
      end
    end

    def unique_visits_desc_formatted
      unique_visits_desc_info.map do |hash|
        unique_visits_desc_template(hash[:url], hash[:unique_visit_amount])
      end
    end

    def visits_desc_info
      webpages_info.sort_by_visits_desc.map(&:to_h)
    end

    def unique_visits_desc_info
      webpages_info.sort_by_unique_visits_desc.map(&:to_h)
    end

    def visits_desc_template(url, amount)
      "#{url} #{amount} visits"
    end

    def unique_visits_desc_template(url, amount)
      "#{url} #{amount} unique views"
    end
  end
end
