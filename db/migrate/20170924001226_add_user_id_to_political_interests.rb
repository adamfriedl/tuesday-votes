class AddUserIdToPoliticalInterests < ActiveRecord::Migration
  def change
    add_column :political_interests, :volunteer_id, :integer
  end
end
