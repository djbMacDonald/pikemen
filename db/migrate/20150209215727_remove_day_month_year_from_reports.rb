class RemoveDayMonthYearFromReports < ActiveRecord::Migration
  def up
    remove_column :reports, :day
    remove_column :reports, :month
    remove_column :reports, :year
  end
  def down
    add_column :reports, :day, :integer
    add_column :reports, :month, :integer
    add_column :reports, :year, :integer
  end
end
