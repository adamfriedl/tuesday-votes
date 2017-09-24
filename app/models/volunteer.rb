class Volunteer < ActiveRecord::Base
  has_many :volunteer_political_interests
  has_many :political_interests, through: :volunteer_political_interests
end
