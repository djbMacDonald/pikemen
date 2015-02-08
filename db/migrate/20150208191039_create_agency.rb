class CreateAgency < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :name
      t.string :jurisdiction
    end
  end
end
