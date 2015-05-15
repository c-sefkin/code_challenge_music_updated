require('spec_helper')

describe Band do

  describe('#venues') do
    it('returns the venues of a band') do
      venue = Venue.create(name: "Bobs Punk House")
      band = Band.new({:venue_ids => [venue.id()]})
      expect(band.venues()).to(eq([venue]))
    end
  end
end
