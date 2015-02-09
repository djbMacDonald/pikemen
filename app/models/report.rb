class Report < ActiveRecord::Base
  belongs_to :agency
  validates :name, :state, :city, presence: true
  validates :name, :state, :city, :month, :day, :year, presence: true, on: :update
end
