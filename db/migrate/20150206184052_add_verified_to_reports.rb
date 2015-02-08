class AddVerifiedToReports < ActiveRecord::Migration
  def change
    add_column :reports, :verified, :boolean, default: false
  end
end
