class Report < ActiveRecord::Base

  validates :name, :state, :city, presence: true
end
