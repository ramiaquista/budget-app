class AddHabtmForExpensesAndCategories < ActiveRecord::Migration[7.0]
  def change
      create_table :categories_expenses, id: false do |t|
        t.belongs_to :categories
        t.belongs_to :expenses
      end
  end
end
