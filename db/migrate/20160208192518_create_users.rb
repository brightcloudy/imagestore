class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :fullname
      t.string :email
      t.integer :access_role

      t.timestamps null: false
    end

    add_attachment :users, :avatar

  end
end
