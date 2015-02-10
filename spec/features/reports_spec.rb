require 'rails_helper'

RSpec.feature 'Managing reports' do
  before(:each) do
    User.create!(email:'fake@fakr.com', password:'fakepassword')
    agency = Agency.create!(name: 'FBI', jurisdiction: 'Federal')
    agency2 = Agency.create!(name: 'NYPD', jurisdiction: 'City')
    Report.create!(name:'John', state:'MA', city:'Boston', verified: true, agency_id: agency.id)
    Report.create!(name:'John', state:'MA', city:'Boston', verified: true, agency_id: agency2.id)
    Report.create!(name:'John', state:'MA', city:'Boston', verified: true, agency_id: agency.id)
    Report.create!(name:'John', state:'MA', city:'Boston', verified: false)
    Report.create!(name:'John', state:'MA', city:'Boston', verified: false)
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
    select('Massachusetts', from: 'report_state')
    fill_in 'City', with: 'Boston'
    click_on 'Submit Report'

    expect(page).to have_content(/submitted/i)
  end
end
