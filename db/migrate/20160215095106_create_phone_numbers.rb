class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string :number
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
