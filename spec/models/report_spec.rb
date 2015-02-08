require 'rails_helper'

RSpec.describe Report do
  describe '.create' do
    it 'creates a new report' do
      expect(Report.create()).to be_a Report
    end

    it 'is invalid without a name' do
      expect(Report.create(state:'MA', city:'Boston', month:'05', day:'11', year:'2001')).not_to be_valid
    end
    it 'is invalid without a state' do
      expect(Report.create(name:'John', city:'Boston', month:'05', day:'11', year:'2001')).not_to be_valid
    end
    it 'is invalid without a city' do
      expect(Report.create(name:'John', state:'MA', month:'05', day:'11', year:'2001')).not_to be_valid
    end
    it 'is valid with a name, state, and city' do
      expect(Report.create(name:'John', state:'MA', city:'Boston', month:'05', day:'11', year:'2001')).to be_valid
    end
  end
end
