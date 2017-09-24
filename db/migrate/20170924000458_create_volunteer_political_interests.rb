class CreateVolunteerPoliticalInterests < ActiveRecord::Migration
  def change
    create_table :volunteer_political_interests do |t|
      t.integer :volunteer_id
      t.integer :political_interest_id
      t.timestamps null: false
    end
  end
end
