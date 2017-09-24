require_relative "spec_helper"

describe "matches volunteer to voter record" do
  
  it 'finds whether a name appears in voter record' do
  @volunteer1 = Volunteer.create(first_name: "Jose", last_name: "Williams")
  @voter1 = Voter.create(name: "Jose Williams")
  expect(@volunteer1.voter_registration.name).to eq("Jose Williams")
  end

end

