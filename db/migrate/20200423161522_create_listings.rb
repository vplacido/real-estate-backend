class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :description
      t.string :address
      t.string :listing_type
      t.integer :price
      t.integer :realtor_id
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
