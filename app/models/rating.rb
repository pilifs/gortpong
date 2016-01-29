class Rating < ActiveRecord::Base
  belongs_to :player
  after_initialize :set_defaults

  def set_defaults
    rating ||= 1500
  end

  

end
