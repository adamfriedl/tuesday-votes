class Volunteer < ActiveRecord::Base
  has_many :volunteer_political_interests
  has_many :political_interests, through: :volunteer_political_interests

  def voter_registration
    Voter.find_by_name(self.first_name + " " + self.last_name)
  end
end
