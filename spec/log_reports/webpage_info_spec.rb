# frozen_string_literal: true

RSpec.describe LogReports::WebpageInfo do
  let(:url) { '/url' }
  let(:visit_ips) { %w[999.999.999.999 999.999.999.999 999.999.111.111] }
  let(:webpage_info) { described_class.new(url, visit_ips) }

  describe '#initialize' do
    it 'creates an object of the described class' do
      expect(webpage_info).to be_kind_of(described_class)
    end
  end

  describe '#visit_amount' do
    it 'respond to method' do
      expect(webpage_info).to respond_to(:visit_amount)
    end

    it 'returns the amount of visits' do
      expect(webpage_info.visit_amount).to eq(visit_ips.size)
    end
  end

  describe '#unique_visit_amount' do
    it 'respond to method' do
      expect(webpage_info).to respond_to(:unique_visit_amount)
    end

    it 'returns the amount of unique visits' do
      expect(webpage_info.unique_visit_amount).to eq(visit_ips.uniq.size)
    end
  end

  describe '#unique_visit_ips' do
    it 'respond to method' do
      expect(webpage_info).to respond_to(:unique_visit_ips)
    end

    it 'returns the unique visits' do
      expect(webpage_info.unique_visit_ips).to eq(visit_ips.uniq)
    end
  end

  describe '#to_h' do
    it 'respond to method' do
      expect(webpage_info).to respond_to(:to_h)
    end

    it 'hash representation' do
      expected = {
        url: webpage_info.url,
        visit_amount: webpage_info.visit_amount,
        unique_visit_amount: webpage_info.unique_visit_amount
      }

      expect(webpage_info.to_h).to eq(expected)
    end
  end

  describe '#add_visit_ip' do
    it 'respond to method' do
      expect(webpage_info).to respond_to(:add_visit_ip)
    end

    it 'adds a visit_ip' do
      new_visit_ip = '999.999.222.222'
      new_visit_ips = visit_ips << new_visit_ip
      webpage_info.add_visit_ip(new_visit_ip)

      expect(webpage_info.visit_ips).to eq(new_visit_ips)
    end
  end
end
