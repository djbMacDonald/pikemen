require 'rails_helper'

RSpec.feature 'Managing reports' do
  before(:each) do
    User.create!(email:'fake@fakr.com', password:'fakepassword')
    agency = Agency.create!(name: 'FBI', jurisdiction: 'Federal')
    agency2 = Agency.create!(name: 'NYPD', jurisdiction: 'City')
    Report.create!(name:'John', state:'MA', city:'Boston', month:'05', day:'11', year:'2001', verified: true, agency_id: agency.id)
    Report.create!(name:'John', state:'MA', city:'Boston', month:'05', day:'11', year:'2001', verified: true, agency_id: agency2.id)
    Report.create!(name:'John', state:'MA', city:'Boston', month:'05', day:'11', year:'2001', verified: true, agency_id: agency.id)
    Report.create!(name:'John', state:'MA', city:'Boston', month:'05', day:'11', year:'2001', verified: false)
    Report.create!(name:'John', state:'MA', city:'Boston', month:'05', day:'11', year:'2001', verified: false)
  end
  scenario 'List all verified reports' do
    visit '/reports'

    expect(page).to have_content 'Reports'
    expect(page).to have_selector 'p', count: 3
  end
  scenario 'Filter by Agency' do
    visit 'reports'
    select('FBI', from: 'agency_name')
    click_on 'Filter'
    expect(page).to have_selector 'p', count: 2
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
