require 'rails_helper'

RSpec.describe 'routes for reports' do
  it 'routes GET /reports to the reports controller' do
    expect(get('/reports')).to route_to('reports#index')
  end
end