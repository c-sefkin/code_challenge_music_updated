class AddColumns < ActiveRecord::Migration
  def change
    add_column(:bands, :venue_id, :integer)
    add_column(:venues, :band_id, :integer)
  end
end
