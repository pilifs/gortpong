class User < ActiveRecord::Base
  # There are no actual users yet. This class is only used for a quick and dirty way to generate a secure "submit key" for our forms.
  has_many :games
  has_many :players

  has_secure_password
end
