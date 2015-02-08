require 'rails_helper'

RSpec.feature 'Managing reports' do
  before(:each) do
    User.create!(email:'fake@fakr.com', password:'fakepassword')
    Report.create!(name:'John', state:'MA', city:'Boston', month:'05', day:'11', year:'2001', verified: true)
    Report.create!(name:'John', state:'MA', city:'Boston', month:'05', day:'11', year:'2001', verified: true)
    Report.create!(name:'John', state:'MA', city:'Boston', month:'05', day:'11', year:'2001', verified: true)
    Report.create!(name:'John', state:'MA', city:'Boston', month:'05', day:'11', year:'2001', verified: false)
    Report.create!(name:'John', state:'MA', city:'Boston', month:'05', day:'11', year:'2001', verified: false)
    visit '/users/sign_in'
    fill_in 'Email', with: 'fake@fakr.com'
    fill_in 'Password', with: 'fakepassword'
    click_on 'Log in'
  end
  scenario 'Sign in' do
    expect(page).to have_content(/logout/i)
  end
  scenario 'Sign out' do
    click_on 'Logout'
    expect(page).to have_content(/login/i)
  end
  scenario 'View unvalidated reports when logged in' do
    click_on 'Validate'
    expect(page).to have_content(/unvalidated/i)
    expect(page).to have_selector 'p', count: 2
  end
  scenario 'Validate a report' do
    click_on 'Validate'

    page.first(:link, 'Verify').click
    expect(page).to have_selector 'p', count: 1
  end
  scenario 'Archive a report' do
    click_on 'Validate'
    page.first(:link, 'Archive').click
    expect(page).to have_selector 'p', count: 1
  end
end
