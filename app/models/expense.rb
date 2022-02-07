class Expense < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  validates :name, :amount, :category_ids, presence: true
end
