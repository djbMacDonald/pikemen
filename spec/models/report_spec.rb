require 'rails_helper'

RSpec.describe Report do
  describe '.create' do
    it 'creates a new report' do
      expect(Report.create()).to be_a Report
    end

    it 'is invalid without a name' do
      expect(Report.create(state:'MA', city:'Boston')).not_to be_valid
    end
    it 'is invalid without a state' do
      expect(Report.create(name:'John', city:'Boston')).not_to be_valid
    end
    it 'is invalid without a city' do
      expect(Report.create(name:'John', state:'MA')).not_to be_valid
    end
  end
end
