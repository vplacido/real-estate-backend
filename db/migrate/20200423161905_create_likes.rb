class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :buyer_id
      t.integer :listing_id

      t.timestamps
    end
  end
end
