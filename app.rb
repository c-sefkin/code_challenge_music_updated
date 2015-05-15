require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}

get('/') do
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end

get('/bands') do
  @bands = Band.all()
  erb(:bands)
end

post('/bands') do
  name = params.fetch("name")
  band = Band.create({:name => name})
  @bands = Band.all()
  erb(:bands)
end

get('/venues') do
  @venues = Venue.all()
  erb(:venues)
end

post('/venues') do
  name = params.fetch("name")
  venue = Venue.create({:name => name})
  @venues = Venue.all()
  erb(:venues)
end

get('/bands/:id') do
  id = params.fetch("id").to_i()
  @band = Band.find(id)
  @venues = Venue.all()
  erb(:band_info)
end

patch('/bands/:id') do
  band_id = params.fetch("id").to_i()
  @band = Band.find(band_id)
  venue_ids = params.fetch("venue_ids", [])
  @band.update({:venue_ids => venue_ids})
  @venues = Venue.all()
  if params.has_key?("name")
    name = params.fetch("name")
    @band.update({:name => name})
  end
  erb(:band_info)
end

delete('/bands/:id') do
  band_id = params.fetch("id").to_i()
  band = Band.find(band_id)
  band.delete()
  @bands = Band.all()
  erb(:bands)
end

get('/venues/:id') do
  id = params.fetch("id").to_i()
  @venue = Venue.find(id)
  @bands = Band.all()
  erb(:venue_info)
end

patch('/venues/:id') do
  venue_id = params.fetch("id").to_i()
  @venue = Venue.find(venue_id)
  band_ids = params.fetch("band_ids", [])
  @venue.update({:band_ids => band_ids})
  @bands = Band.all()
  if params.has_key?("name")
    name = params.fetch("name")
    @venue.update({:name => name})
  end
  erb(:venue_info)
end


delete('/venues/:id') do
  venue_id = params.fetch("id").to_i()
  venue = Venue.find(venue_id)
  venue.delete()
  @venues = Venue.all()
  erb(:venues)
end
