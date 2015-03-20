require 'rails_helper'

describe 'user subscribe' do
  before { visit root_path }

  it 'success with valid email' do
    fill_in 'user_email', with: 'test@email.com'
    click_button 'Send'
    expect(page).to have_content(I18n.t('subscribed'))
    expect(page).to have_button('Send', disabled: true)
  end

  context 'with invalid email' do
    it 'fails if taken' do
      u = User.create(email: 'test@email.com')
      fill_in 'user_email', with: u.email
      click_button 'Send'
      expect(page).to have_content('Email has already been taken')
      u.destroy
    end

    it 'fails with dummy email' do
      fill_in 'user_email', with: 'notemail.com'
      click_button 'Send'
      expect(page).to have_content('Email is invalid')
    end
  end
end