class AddRandomUrlIndexToImages < ActiveRecord::Migration
  def change
    add_index :images, :random_url, unique: true
  end
end
