require 'rails_helper'

RSpec.feature 'Managing reports' do
  before(:each) do
    user = User.create!(email:'fake@fakr.com', username:'fakie', password:'password')
    fbi = Agency.create!(name:'FBI', jurisdiction:'Federal')
    dea = Agency.create!(name:'DEA', jurisdiction:'Federal')
    Report.create!(name:'John Smith', state: 'New York', city:'New York', incident_date:'2004-02-02', agency_id: fbi.id, user_id: user.id, verified: true, archived: false)
    Report.create!(name:'John Smith', state: 'New York', city:'New York', incident_date:'2004-02-02', agency_id: fbi.id, user_id: user.id, verified: true, archived: false)
    Report.create!(name:'John Smith', state: 'New York', city:'New York', incident_date:'2004-02-02', agency_id: fbi.id, user_id: user.id, verified: true, archived: false)
    Report.create!(name:'John Smith', state: 'New York', city:'New York', incident_date:'2004-02-02', agency_id: dea.id, user_id: user.id, verified: true, archived: false)
    Report.create!(name:'John Smith', state: 'Maine', city:'New York', incident_date:'2004-02-02', agency_id: dea.id, user_id: user.id, verified: true, archived: false)
    Report.create!(name:'John Smith', state: 'Maine', city:'New York', incident_date:'2004-02-02', agency_id: dea.id, user_id: user.id, verified: true, archived: false)
    Report.create!(name:'John Smith', state: 'Maine', city:'New York', incident_date:'2004-02-02', agency_id: dea.id, user_id: user.id, verified: true, archived: false)
    Report.create!(name:'John Smith', state: 'Maine', city:'New York', incident_date:'2004-02-02', agency_id: fbi.id, user_id: user.id, verified: true, archived: false)
  end
  scenario 'List all verified reports' do
    visit '/reports'

    expect(page).to have_content 'People'
    expect(page).to have_selector '.panel', count: 8
  end
  scenario 'Filter by Agency' do
    visit 'reports'
    select('FBI', from: 'agency_name')
    click_on 'Filter'
    expect(page).to have_selector '.panel', count: 4
  end
  scenario 'Filter by State' do
    visit 'reports'
    select('New York', from: 'state_name')
    click_on 'Filter'
    expect(page).to have_selector '.panel', count: 4
  end
  scenario 'Filter by Agency and State' do
    visit 'reports'
    select('FBI', from: 'agency_name')
    select('New York', from: 'state_name')
    click_on 'Filter'
    expect(page).to have_selector '.panel', count: 3
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
