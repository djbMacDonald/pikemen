require 'rails_helper'

RSpec.feature 'Managing reports' do
  scenario 'List all verified reports' do
    Report.create!(name:'John', state:'MA', city:'Boston', agency:'Boston Police', month:'05', day:'11', year:'2001', verified:true)
    Report.create!(name:'John', state:'MA', city:'Boston', agency:'Boston Police', month:'05', day:'11', year:'2001', verified:true)
    Report.create!(name:'John', state:'MA', city:'Boston', agency:'Boston Police', month:'05', day:'11', year:'2001', verified:true)
    Report.create!(name:'John', state:'MA', city:'Boston', agency:'Boston Police', month:'05', day:'11', year:'2001', verified:false)
    Report.create!(name:'John', state:'MA', city:'Boston', agency:'Boston Police', month:'05', day:'11', year:'2001', verified:false)

    visit '/reports'

    expect(page).to have_content 'Reports'
    expect(page).to have_selector 'p', count: 3
  end
end
