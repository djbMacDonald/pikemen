class Remove < ActiveRecord::Migration
  def up
    remove_column :reports, :agency
  end

  def down
    add_column :reports, :agency, :string
  end
end
