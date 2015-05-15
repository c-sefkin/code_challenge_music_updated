require('spec_helper')

describe Band do

  describe('#venues') do
    it('returns the venues of a band') do
      venue = Venue.create(name: "Bobs Punk House")
      band = Band.new({:venue_ids => [venue.id()]})
      expect(band.venues()).to(eq([venue]))
    end
  end

  it('validates the presence of a name') do
    band = Band.new(name: "")
    expect(band.save()).to(eq(false))
  end

  describe('#capitalize') do
    it('capitalizes the name of a band') do
      band = Band.create({:name => "test"})
      expect(band.name()).to(eq("Test"))
    end
  end
end
