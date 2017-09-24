class AddPoliticalInterestIdToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :political_interest_id, :integer
  end
end
