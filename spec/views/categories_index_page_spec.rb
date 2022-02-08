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
    end
    it 'should render the name of the category inside the li item' do
      expect(page.find('.cat-name')).to have_content(@category.name)
    end
    it 'should render the total amount spended in that category' do
      expect(page.find('.cat-total-amount')).to have_content('0')
    end
    it 'should render the add new category at the bottom of the index page' do
      add_new = find('.new-category')
      expect(page).to have_button(add_new.text)
    end
  end
end
