class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.integer :like_id
      t.integer :buyer_id
      t.integer :listing_id
      t.integer :realtor_id
      t.integer :city_id
      t.integer :review_id

      t.timestamps
    end
  end
end
