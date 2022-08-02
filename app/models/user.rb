class User < ApplicationRecord

  has_secure_password

  before_save {self.mail = mail.downcase}
  validates :name, presence: true
  validates :mail, presence: true, uniqueness: true
  validates_format_of :mail, with: URI::MailTo::EMAIL_REGEXP

  has_many :todos, dependent: :destroy
 end
