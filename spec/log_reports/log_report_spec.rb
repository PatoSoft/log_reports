# frozen_string_literal: true

RSpec.describe LogReports::LogReport do
  let(:log_report)  do
    webpages_info = LogReports::LogParser.parse('spec/fixtures/test.log')
    LogReports::LogReport.new(webpages_info)
  end

  describe '#initialize' do
    it 'creates an object of the described class' do
      expect(log_report).to be_kind_of(described_class)
    end
  end

  describe '#visits_desc_report' do
    it 'respond to method' do
      expect(log_report).to respond_to(:visits_desc_report)
    end

    it 'Print the report of webpages sorted desc by visits' do
      expected = <<~EXPECTED

        * Webpages with most page views:
        /help_page/1 6 visits
        /about 4 visits
        /about/2 4 visits
        /contact 3 visits
      EXPECTED

      expect { log_report.visits_desc_report }.to output(expected).to_stdout
    end
  end

  describe '#unique_visits_desc_report' do
    it 'respond to method' do
      expect(log_report).to respond_to(:unique_visits_desc_report)
    end

    it 'Print the report of webpages sorted desc by unique visits' do
      expected = <<~EXPECTED

        * Webpages with most unique page views:
        /about/2 4 unique views
        /contact 3 unique views
        /help_page/1 3 unique views
        /about 1 unique views
      EXPECTED

      expect {
        log_report.unique_visits_desc_report
      }.to output(expected).to_stdout
    end
  end
end
