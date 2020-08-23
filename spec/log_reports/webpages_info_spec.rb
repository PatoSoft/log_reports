# frozen_string_literal: true

RSpec.describe LogReports::WebpagesInfo do
  let(:webpages_info) { LogReports::LogParser.parse('spec/fixtures/test.log') }

  describe '#initialize' do
    it 'creates an object of the described class' do
      expect(webpages_info).to be_kind_of(described_class)
    end
  end

  describe '#sort_by_visits_desc' do
    it 'respond to method' do
      expect(webpages_info).to respond_to(:sort_by_visits_desc)
    end

    it 'returns WebpageInfo(s) sorted desc by visits' do
      expected_order = %w[/help_page/1 /about /about/2 /contact]
      result = webpages_info.sort_by_visits_desc

      expect(result).to be_a_kind_of(Array)
      expect(result.first).to be_a_kind_of(LogReports::WebpageInfo)
      expect(result.map(&:url)).to eq(expected_order)
    end

    describe '#sort_by_unique_visits_desc' do
      it 'respond to method' do
        expect(webpages_info).to respond_to(:sort_by_unique_visits_desc)
      end

      it 'returns WebpageInfo(s) sorted desc by unique visits' do
        expected_order = %w[/about/2 /contact /help_page/1 /about]
        result = webpages_info.sort_by_unique_visits_desc

        expect(result).to be_a_kind_of(Array)
        expect(result.first).to be_a_kind_of(LogReports::WebpageInfo)
        expect(result.map(&:url)).to eq(expected_order)
      end
    end

    describe '#add_webpage_info' do
      it 'respond to method' do
        expect(webpages_info).to respond_to(:add_webpage_info)
      end

      it 'adds a webpage_info to the webpages collection' do
        webpage_info = LogReports::WebpageInfo.new('/url', ['999.999.999.999'])
        webpages_amount = webpages_info.webpages.size
        webpages_info.add_webpage_info(webpage_info)

        expect(webpages_info.webpages.size).to eq(webpages_amount + 1)
        expect(webpages_info.webpages.last).to be webpage_info
      end
    end
  end
end
