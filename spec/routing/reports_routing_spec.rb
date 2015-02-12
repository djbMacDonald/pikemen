require 'rails_helper'

RSpec.describe 'routes for reports' do
  it 'routes GET /users/sign_in to the devise controller' do
    expect(get('/users/sign_in')).to route_to('devise/sessions#new')
  end
  it 'routes Post /users/sign_in to the create action' do
    expect(post('/users/sign_in')).to route_to('devise/sessions#create')
  end
  it 'routes DELETE /users/sign_out to the destroy action' do
    expect(delete('/users/sign_out')).to route_to('devise/sessions#destroy')
  end
  it 'routes GET / to the welcome controller' do
    expect(get('/')).to route_to('welcome#index')
  end
  it 'routes POST /agencies to the create action' do
    expect(post('/agencies')).to route_to('agencies#create')
  end
    it 'routes GET /agencies/1 to the agencies controller and sets id' do
    expect(get('/agencies/1')).to route_to(controller: 'agencies', action: 'show', id: '1')
  end
  it 'routes GET /reports to the reports controller' do
    expect(get('/reports')).to route_to('reports#index')
  end
  it 'routes GET /reports/new' do
    expect(get('/reports/new')).to route_to('reports#new')
  end
  it 'routes POST /reports to the create action' do
    expect(post('/reports')).to route_to('reports#create')
  end
  it 'routes GET /reports/check to the reports controller' do
    expect(get('/reports/check')).to route_to('reports#check')
  end
  it 'routes GET /users/1 to the users controller and sets id' do
    expect(get('/users/1')).to route_to(controller: 'users', action: 'show', id: '1')
  end
  it 'routes anything else to the root path' do
    expect(get('/bmsdfd')).to route_to(controller: 'welcome', action: 'index', path: 'bmsdfd')
  end


end
