require 'rails_helper'

RSpec.describe 'Category Show validation', type: :system do
  describe 'Category Show' do
    before do
      visit new_user_session_path
      @user = User.create(full_name: 'Jhon Doe', email: 'jhon@gmail.com', password: '123456')
      @category = Category.new(name: 'Foods', user_id: @user.id)
      @category.icon.attach(io: File.open('/Users/ramiaq/Downloads/13 1.png'), filename: '13 1.png',
                            content_type: 'image/png')
      @category.save
      @expense = Expense.new(name: 'Pizza', amount: 2.0, user_id: @user.id)
      @expense.category_ids = [@category.id]
      @expense.save
      page.fill_in 'Email', with: 'jhon@gmail.com'
      page.fill_in 'Password', with: '123456'
      click_button('Log in')
      sleep(3)
      visit category_expense_path(category_id: @category.id, id: @expense.id)
    end
    it 'should render the name of the transaction in the page' do
      expect(page.find('.expense-data-container')).to have_content("Name: #{@expense.name}")
      expect(page.find('.expense-amount')).to have_content("$ #{@expense.amount}")
      sleep(3)
    end
    it 'should render the edit transaction btn in the page' do
      edit_btn = find('.btn-secondary')
      expect(page).to have_button(edit_btn.text)
    end
    it 'should render the delete transaction btn in the page' do
      warning_btn = find('.btn-warning')
      expect(page).to have_button(warning_btn.text)
    end
  end
end
