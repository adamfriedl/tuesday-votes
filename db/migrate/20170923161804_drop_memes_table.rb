class DropMemesTable < ActiveRecord::Migration
  def change
    drop_table :memes
  end
end
