# frozen_string_literal: true

RSpec.describe LogReports::LogParser do
  let(:log_parser) { described_class.new('spec/fixtures/test.log') }

  describe '#initialize' do
    it 'creates an object of the described class' do
      expect(log_parser).to be_kind_of(described_class)
    end

    it 'returns an error is there is NO log_path' do
      expect { described_class.new }.to raise_error(ArgumentError)
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

    describe '#parse (instance method)' do
      it 'respond to method' do
        expect(described_class).to respond_to(:parse)
      end

      it 'returns a WebpagesInfo' do
        result = described_class.parse('spec/fixtures/test.log')
        expect(result).to be_a_kind_of(LogReports::WebpagesInfo)
      end
    end
  end
end
