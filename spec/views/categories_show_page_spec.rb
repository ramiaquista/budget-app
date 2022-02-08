require 'rails_helper'

RSpec.describe 'Category index validation', type: :system do
  describe 'Category Index' do
    before do
      visit new_user_session_path
      @user = User.create(full_name: 'Jhon Doe', email: 'jhon@gmail.com', password: '123456')
      @category = Category.new(name: 'Foods', user_id: @user.id)
      @category.icon.attach(io: File.open('/Users/ramiaq/Downloads/13 1.png'), filename: '13 1.png',
                            content_type: 'image/png')
      @category.save
      page.fill_in 'Email', with: 'jhon@gmail.com'
      page.fill_in 'Password', with: '123456'
      click_button('Log in')
      sleep(3)
      visit category_path(id: @category.id)
    end
    it 'should render the title for category#show inside the navbar' do
      expect(page.find('.nav-title-container')).to have_content('Category')
      sleep(3)
    end
    it 'should render the name for category inside the li item' do
      expect(page.find('.cat-name')).to have_content(@category.name)
      sleep(3)
    end
  end
end
