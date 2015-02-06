require 'rails_helper'

RSpec.describe 'routes for reports' do
  it 'routes GET /reports to the reports controller' do
    expect(get('/reports')).to route_to('reports#index')
  end
  it 'routes GET /reports/new' do
    expect(get('/reports/new')).to route_to('reports#new')
  end
  it 'routes POST /reports to the create action' do
    expect(post('/reports')).to route_to('reports#create')
  end
end
