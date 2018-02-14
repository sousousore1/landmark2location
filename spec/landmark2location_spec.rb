RSpec.describe Landmark2location do
  it 'has a version number' do
    expect(Landmark2location::VERSION).not_to be nil
  end

  context 'landmark is Google inc' do
    let(:landmark) { 'Google inc' }
    let(:location) { Landmark2location::Location.new(landmark) }

    describe '#landmark' do
      it 'is same' do
        expect(location.landmark).to eq landmark
      end
    end

    describe '#ok?' do
      it 'is true' do
        expect(location.ok?).to be_truthy
      end
    end

    describe '#get_postal_codes' do
      it 'resolve postal code from landmark' do
        expect(location.get_postal_codes).to eq %w(90210)
      end
    end

    describe '#get_addresses' do
      it 'resolve formatted address from landmark' do
        address = '331 Foothill Rd, Beverly Hills, CA 90210 アメリカ合衆国'
        expect(location.get_formatted_addresses).to eq [address]
      end
    end
  end

  context 'landmark is 京都駅' do
    let(:landmark) { '京都駅' }
    let(:location) { Landmark2location::Location.new(landmark) }

    describe '#landmark' do
      it 'is same' do
        expect(location.landmark).to eq landmark
      end
    end

    describe '#ok?' do
      it 'is true' do
        expect(location.ok?).to be_truthy
      end
    end

    describe '#get_postal_codes' do
      it 'resolve postal code from landmark' do
        expect(location.get_postal_codes).to eq []
      end
    end

    describe '#get_addresses' do
      it 'resolve formatted address from landmark' do
        address = '日本、京都府京都市下京区東塩小路釜殿町'
        expect(location.get_formatted_addresses).to eq [address]
      end
    end
  end

  context 'landmark is 清水寺' do
    let(:landmark) { '清水寺' }
    let(:location) { Landmark2location::Location.new(landmark) }

    describe '#landmark' do
      it 'is same' do
        expect(location.landmark).to eq landmark
      end
    end

    describe '#ok?' do
      it 'is true' do
        expect(location.ok?).to be_truthy
      end
    end

    describe '#get_postal_codes' do
      it 'resolve postal code from landmark' do
        expect(location.get_postal_codes).to eq ['605-0862']
      end
    end

    describe '#get_addresses' do
      it 'resolve formatted address from landmark' do
        address = '日本、〒605-0862 京都府京都市東山区清水１丁目２９４'
        expect(location.get_formatted_addresses).to eq [address]
      end
    end
  end
end
