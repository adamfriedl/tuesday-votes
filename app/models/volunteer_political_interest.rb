class VolunteerPoliticalInterest < ActiveRecord::Base
  belongs_to :volunteer
  belongs_to :political_interest
end
