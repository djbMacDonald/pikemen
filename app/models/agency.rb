class Agency < ActiveRecord::Base
  JURISDICTIONS = %w{Federal State County City}

  has_many :reports
end
