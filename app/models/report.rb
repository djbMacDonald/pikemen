class Report < ActiveRecord::Base
  belongs_to :agency
  validates :name, :state, :city, presence: true
end
