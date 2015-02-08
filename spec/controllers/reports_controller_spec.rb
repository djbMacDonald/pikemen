require 'rails_helper'

RSpec.describe ReportsController do
  let(:valid_attributes) {
    { name:'John', state:'MA', city:'Boston', month:'05', day:'11', year:'2001', verified: true }
  }
  let(:invalid_attributes) {
    { name: nil, state: nil, city: nil, month: nil, day: nil, year: nil, verified: nil }
  }

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
  describe 'POST create' do
    context 'with valid attributes' do
      it 'saves a new report' do
        expect { post :create, report: valid_attributes }.to change(Report, :count).by 1
      end
      it 'assigns @report' do
        post :create, report: valid_attributes
        expect(assigns(:report)).to be_a Report
        expect(assigns(:report)).to be_persisted
      end
      it 'redirects to the root route' do
        post :create, report: valid_attributes
        expect(response).to redirect_to(root_path)
      end
    end
    context 'with invalid attributes' do
      it 'assigns @report, but does not save a new report' do
        post :create, report: invalid_attributes
        expect(assigns(:report)).to be_a_new Report
      end
      it 're-renders the new template' do
        post :create, report: invalid_attributes
        expect(response).to render_template 'new'
      end
    end
  end
end
