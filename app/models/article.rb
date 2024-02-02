class Article < ApplicationRecord
  has_and_belongs_to_many :categories, join_table: :articles_categories
  belongs_to :user
  has_one_attached :image#change to many!!!!


  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 20 }
  validates :categories, presence: true
end
