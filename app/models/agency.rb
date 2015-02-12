class Agency < ActiveRecord::Base
  #choices for jurisdiction level when creating agencies.
  JURISDICTIONS = %w{Federal State County City}

  has_many :reports
  validates :name, presence: true, uniqueness: :true
  validates :jurisdiction, presence: true
end
