# frozen_string_literal: true

module LogReports
  # A collection of webpages (WebpageInfo) and methods for querying them
  class WebpagesInfo
    attr_reader :webpages

    def initialize(webpages = [])
      @webpages = webpages
    end

    def sort_by_visits_desc
      webpages.sort_by(&:visit_amount).reverse
    end

    def sort_by_unique_visits_desc
      webpages.sort_by(&:unique_visit_amount).reverse
    end

    def add_webpage_info(webpage_info)
      webpages.push(webpage_info)
    end
  end
end
