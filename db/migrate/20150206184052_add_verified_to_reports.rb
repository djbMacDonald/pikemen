class AddVerifiedToReports < ActiveRecord::Migration
  def change
    add_column :reports, :verified, :boolean
  end
end
