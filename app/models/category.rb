class Category < ActiveRecord::Base
  validates :name, presence: true
  has_many :has_categories
  has_many :articles, through: :has_categories
end
