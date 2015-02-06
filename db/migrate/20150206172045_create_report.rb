class CreateReport < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :name
      t.string :state
      t.string :city
      t.string :agency
      t.integer :month
      t.integer :day
      t.integer :year
    end
  end
end
