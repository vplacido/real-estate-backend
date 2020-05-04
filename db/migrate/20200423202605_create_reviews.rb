class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      # t.integer :stars
      # t.string :description
      # t.integer :like_id
      # t.integer :buyer_id
      # t.integer :listing_id
      # t.integer :realtor_id
      t.integer :buyer_id, null: false
      t.integer :listing_id, null: false
      t.text :review
      t.integer :rating

      t.timestamps
    end
    add_index :reviews, :buyer_id
    add_index :reviews, :listing_id
  end
end
