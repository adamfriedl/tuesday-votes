class Volunteer < ActiveRecord::Base
  has_many :volunteer_political_interests
  has_many :political_interests, through: :volunteer_political_interests

  def match_voters(voter_array)
    matches = []
    voter_array.each do |voter|
      voter_sep_names = voter.name.split(' ')
      voter_last_name = voter_sep_names.last
      if self.last_name.match(voter_last_name)
        matches << self
      end
    end
    return matches
  end


end
