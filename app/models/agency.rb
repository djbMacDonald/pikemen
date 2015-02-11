class Agency < ActiveRecord::Base
  JURISDICTIONS = %w{Federal State County City}

  has_many :reports
  validates :name, presence: true, uniqueness: :true
  validates :jurisdiction, presence: true
end
