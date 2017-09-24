require_relative "spec_helper"

# def app
#   ApplicationController
# end

describe "Application Controller" do
  describe "new action" do
    
    it "can visit '/'" do
      get '/'
      expect(last_response.status).to eq(200)
    end

    it "'/' responds with a welcome message" do
      get '/'
      expect(last_response.body).to include("Thanks for joining in our work!")
    end

    it "'/' loads form to create new volunteer" do
      visit '/'
      expect(page).to have_field(:volunteer_first_name)
    end

    it "'/' form has a checkbox for existing political interests" do
      @political_interest1 = PoliticalInterest.create(name: "Jobs")
      @political_interest2 = PoliticalInterest.create(name: "Education")
      visit '/'
      expect(page.has_unchecked_field?(@political_interest1.name)).to eq(true)
      expect(page.has_unchecked_field?(@political_interest2.name)).to eq(true)
    end

    it "'/' creates a new volunteer and associates an existing political interest" do
      @political_interest1 = PoliticalInterest.create(name: "Jobs")
      @political_interest2 = PoliticalInterest.create(name: "Education")
      visit '/'
      fill_in "volunteer_first_name", with: "Bill"
      check(@political_interest1.name)
      click_button "Create Volunteer"
      @volunteer = Volunteer.last
      expect(@volunteer.first_name).to eq("Bill")  
      expect(@volunteer.political_interests.first.name).to eq("Jobs")
    end

    it "'/' creates a new volunteer and new existing political interest" do
      @political_interest1 = PoliticalInterest.create(name: "Jobs")
      @political_interest2 = PoliticalInterest.create(name: "Education")
      visit '/'
      fill_in "volunteer_first_name", with: "Bill"
      fill_in "political_interest_name", with: "Defense"
      click_button "Create Volunteer"
      @volunteer = Volunteer.last
      @political_interest = PoliticalInterest.last
      expect(@volunteer.first_name).to eq("Bill")
      expect(@political_interest.name).to eq("Defense")
    end

    it "redirects/refreshes '/' after form submission" do
      @political_interest1 = PoliticalInterest.create(name: "Jobs")
      @political_interest2 = PoliticalInterest.create(name: "Education")
      visit '/'
      fill_in "volunteer_first_name", with: "Bill"
      check(@political_interest1.name)
      click_button "Create Volunteer"
      @volunteer = Volunteer.last
      expect(page.current_path).to eq ('/')
    end


  end
end


