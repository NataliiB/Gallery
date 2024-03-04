class User < ApplicationRecord
  has_secure_password
  before_create :confirmation_token
  has_one_attached :avatar
  has_many :categories
  has_many :articles


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable

  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  validates :password, presence: true, length: { minimum: 2 }
 end
