# frozen_string_literal: true

RSpec.describe LogReports::LogParser do
  let(:log_parser) { described_class.new('spec/fixtures/test.log') }

  describe '#initialize' do
    it 'creates an object of the described class' do
      expect(log_parser).to be_kind_of(described_class)
    end
  end

  describe '#to_webpages_info' do
    it 'respond to method' do
      expect(log_parser).to respond_to(:to_webpages_info)
    end

    it 'returns a WebpagesInfo with WebpageInfo(s)' do
      result = log_parser.to_webpages_info

      expect(result).to be_a_kind_of(LogReports::WebpagesInfo)
      expect(result.webpages.any?).to be(true)
      expect(result.webpages.first).to be_a_kind_of(LogReports::WebpageInfo)
    end
  end
end
