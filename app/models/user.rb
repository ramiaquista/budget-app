class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :full_name, :email, presence: true
  has_many :categories, dependent: :destroy
  has_many :expenses, dependent: :destroy
end
