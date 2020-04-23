class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :city_name
      t.string :state_name
      t.string :zipcode

      t.timestamps
    end
  end
end
