require 'rails_helper'

describe MainController do
  include ActiveJob::TestHelper

  describe 'GET #index' do
    before { get :index }
    it { expect(assigns(:user)).to be_a(User) }
  end

  describe 'POST #create' do
    it "succeed with valid email" do
      expect{
        post :create, {user: {email: 'test@email.com'}}
      }.to change(User, :count).by(1)
      expect(flash[:notice]).to eq(I18n.t('subscribed'))
      expect(response).to redirect_to(root_path)
    end

    it "sends email in background" do
      expect{
        post :create, {user: {email: 'test@email.com'}}
      }.to change{ enqueued_jobs.size }.by(1)
    end

    it "fails with invalid email" do
      post :create, {user: {email: 'notemail.co'}}
      expect(flash[:danger]).to eq('Email is invalid')
    end
  end
end
