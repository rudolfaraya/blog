require 'rails_helper'
include Warden::Test::Helpers

RSpec.feature "Users", type: :feature do
  context 'create a new user' do
    before(:each) do
      visit new_user_registration_path
    end
    scenario "should be successful" do
      within('form') do
        fill_in 'user_email', :with => 'newuser@example.com'
        fill_in 'user_password', :with => 'userpassword'
        fill_in 'user_password_confirmation', :with => 'userpassword'
      end
      click_button 'Registrarse'
      expect(page).to have_content('Bienvenido newuser@example.com')
    end

    scenario "should fail for password confirmation left" do
      visit new_user_registration_path
      within('form') do
        fill_in 'user_email', with: 'newuser@example.com'
        fill_in 'user_password', with: 'userpassword'
      end
      click_button 'Registrarse'
      expect(page).to have_content('Password confirmation doesn\'t match')
    end

    scenario "should fail for email left" do
      visit new_user_registration_path
      within('form') do
        fill_in 'user_password', with: 'userpassword'
        fill_in 'user_password_confirmation', with: 'userpassword'
      end
      click_button 'Registrarse'
      expect(page).to have_content('Email can\'t be blank')
    end
  end

  context 'sign in' do
    scenario "should be successful" do
      visit user_session_path
      fill_in 'user_email', with: 'rodolfo.araya@multiwireless.cl'
      fill_in 'user_password', with: 'rodolfoaraya2018'
      find("input[type='submit']").click
      expect(page).to have_content('rodolfo.araya@multiwireless.cl')
    end

    scenario "should fail" do

    end

  end
end
