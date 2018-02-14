RSpec.describe Landmark2location do
  it 'has a version number' do
    expect(Landmark2location::VERSION).not_to be nil
  end

  describe '#landmark' do
    let(:landmark) { 'Google' }
    it 'is Google' do
      location = Landmark2location::Location.new(landmark)
      expect(location.landmark).to eq landmark
    end
  end

  describe '#get_postal_code' do
    let(:landmark) { 'Google' }
    it 'resolve postal code from landmark' do
      location = Landmark2location::Location.new(landmark)
      expect(location.get_postal_code).to eq '94043'
    end
  end

  describe '#get_address' do
    let(:landmark) { 'Google' }
    it 'resolve formatted address from landmark' do
      location = Landmark2location::Location.new(landmark)
      google_address = 'Google Bldg 1842, 1842 N Shoreline Blvd, Mountain View, CA 94043 アメリカ合衆国'
      expect(location.get_formatted_address).to eq google_address
    end
  end
end
