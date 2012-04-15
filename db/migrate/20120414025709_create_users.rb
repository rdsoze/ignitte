class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :image_url
      t.integer :count

      t.timestamps
    end
  end
end
