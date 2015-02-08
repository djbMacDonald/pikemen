class AddAgencyIdToReport < ActiveRecord::Migration
  def change
    add_reference :reports, :agency, index: true
    add_foreign_key :reports, :agencies
  end
end
