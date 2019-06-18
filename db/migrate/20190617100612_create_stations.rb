# frozen_string_literal: true

class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :name
      t.string :uid
      t.float :latitude
      t.float :longitude
      t.integer :ebikes
      t.integer :free_bikes
      t.boolean :has_ebikes
      t.integer :empty_slots

      t.timestamps
    end
  end
end
