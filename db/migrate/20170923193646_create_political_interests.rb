class CreatePoliticalInterests < ActiveRecord::Migration
  def change
    create_table :political_interests do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
