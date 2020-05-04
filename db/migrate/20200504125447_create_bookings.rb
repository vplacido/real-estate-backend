class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.integer :num_guests
      t.integer :listing_id
      t.integer :buyer_id

      t.timestamps
    end
    add_index :bookings, :listing_id
    add_index :bookings, :buyer_id
  end
end
