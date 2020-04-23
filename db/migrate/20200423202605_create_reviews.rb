class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.string :description
      t.integer :like_id
      t.integer :buyer_id
      t.integer :listing_id
      t.integer :realtor_id

      t.timestamps
    end
  end
end
