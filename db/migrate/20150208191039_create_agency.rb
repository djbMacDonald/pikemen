class CreateAgency < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.text :name
      t.string :jurisdiction
    end
  end
end
