class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :first_name
      t.string :middle_initial
      t.string :last_name
      t.date :date_of_birth
      t.timestamps null: false
    end
  end
end