class PoliticalInterest < ActiveRecord::Base
  has_many :volunteer_political_interests
  has_many :volunteers, through: :volunteer_political_interests
end
