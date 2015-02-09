class AddIncidnetDateToReports < ActiveRecord::Migration
  def change
    add_column :reports, :incident_date, :date
  end
end
