class User < ApplicationRecord
  validates :name,
            presence: true,
            uniqueness: {
              message: 'Пользователь с таким именем уже существует'
            }

  has_secure_password

  has_many :tasks

  validates :email,
            format: {
              with: URI::MailTo::EMAIL_REGEXP,
              message: 'email имеет некоректное значение'
            }
end
