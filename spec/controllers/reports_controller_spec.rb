require 'rails_helper'

RSpec.describe ReportsController do
  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq 200
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'assigns @reports' do
      reports = Report.where(verified: true)
      get :index
      expect(assigns(:reports)).to eq reports
    end
  end
  describe 'GET new' do
    it 'has a 200 status code' do
      get :new
      expect(response.status).to eq 200
    end
    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
    it 'assigns @report' do
      get :new
      expect(assigns(:report)).to be_a_new Report
    end
  end
end
