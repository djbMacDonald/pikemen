class AddArchivedToReports < ActiveRecord::Migration
  def change
    add_column :reports, :archived, :boolean, default: false
  end
end
