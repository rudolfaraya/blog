require 'rails_helper'

RSpec.feature "Article", type: :feature do
  context 'create a new article' do
    before(:each) do
      visit user_session_path
      within('form') do
        fill_in 'user_email', with: 'rodolfo.araya@multiwireless.cl'
        fill_in 'user_password', with: 'rodolfoaraya2018'
      end
      find("input[type='submit']").click
    end
    scenario "should be successful" do
      visit new_article_path
      within('form') do
        fill_in 'article_title', with: 'Mi primer artículo'
        fill_in 'article_body', with: 'Este es el cuerpo del artículo'
        find(:css, "#categories_[value='1']").set(true)
      end
      find("input[type='submit']").click
      expect(page).to have_content('Mi primer artículo')
    end

    scenario "should fail - body left" do
      visit new_article_path
      within('form') do
        fill_in 'article_title', with: 'Mi primer artículo'
        find(:css, "#categories_[value='1']").set(true)
      end
      find("input[type='submit']").click
      expect(page).to have_content('Body can\'t be blank')
    end

    scenario "should fail - title left" do
      visit new_article_path
      within('form') do
        fill_in 'article_body', with: 'Este es el cuerpo del artículo'
        find(:css, "#categories_[value='1']").set(true)
      end
      find("input[type='submit']").click
      expect(page).to have_content('Title can\'t be blank')
    end
  end

  context 'index published articles' do
    scenario "should be successful" do
      visit articles_path
      expect(page).to have_content('Lista de Artículos')
    end
  end
end