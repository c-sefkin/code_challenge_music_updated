require('spec_helper')

describe Venue do

  describe('#bands') do
    it('returns the the bands of a venue') do
      band = Band.create(name: "Butthole Surfers")
      venue = Venue.new({:band_ids => [band.id()]})
      expect(venue.bands()).to(eq([band]))
    end
  end

  it('validates the presence of a name') do
    venue = Venue.new(name: "")
    expect(venue.save()).to(eq(false))
  end

  describe('#capitalize') do
    it('capitalizes the name of a venue') do
      venue = Venue.create({:name => "test"})
      expect(venue.name()).to(eq("Test"))
    end
  end
end
