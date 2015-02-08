require 'rails_helper'

RSpec.feature 'Managing reports' do
  scenario 'List all verified reports' do
    Report.create!(name:'John', state:'MA', city:'Boston', month:'05', day:'11', year:'2001', verified: true)
    Report.create!(name:'John', state:'MA', city:'Boston', month:'05', day:'11', year:'2001', verified: true)
    Report.create!(name:'John', state:'MA', city:'Boston', month:'05', day:'11', year:'2001', verified: true)
    Report.create!(name:'John', state:'MA', city:'Boston', month:'05', day:'11', year:'2001', verified: false)
    Report.create!(name:'John', state:'MA', city:'Boston', month:'05', day:'11', year:'2001', verified: false)

    visit '/reports'

    expect(page).to have_content 'Reports'
    expect(page).to have_selector 'p', count: 3
  end
  scenario 'Create a new report' do
    visit 'reports/new'

    fill_in 'Name', with: 'John Doe'
    fill_in 'State', with: 'MA'
    fill_in 'City', with: 'Boston'
    fill_in 'Month', with: 'Feb'
    fill_in 'Day', with: '11'
    fill_in 'Year', with: '2012'
    click_on 'Create Report'
    expect(page).to have_content(/submitted/i)
  end
end
