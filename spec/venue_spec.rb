require('spec_helper')

describe Venue do

  describe('#bands') do
    it('returns the the bands of a venue') do
      band = Band.create(name: "Butthole Surfers")
      venue = Venue.new({:band_ids => [band.id()]})
      expect(venue.bands()).to(eq([band]))
    end
  end
end
