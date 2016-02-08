class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :random_url
      t.string :extension
      t.datetime :upload_time

      t.timestamps null: false
    end

    add_attachment :images, :document

  end
end
