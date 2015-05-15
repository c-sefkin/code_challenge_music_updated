class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
  validates(:name, :presence => true)

  private

  define_method(:capitalize_title) do
    self.name=(name().capitalize())
  end
end
