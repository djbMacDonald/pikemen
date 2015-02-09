class Report < ActiveRecord::Base
  belongs_to :agency
  belongs_to :user
  validates :name, :state, :city, presence: true
  validates :name, :state, :city, :month, :day, :year, presence: true, on: :update
end
