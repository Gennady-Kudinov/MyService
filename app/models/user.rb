class User < ApplicationRecord
  validates :name,
            presence: { message: 'Имя не может быть пустым' },
            uniqueness: {
              message: 'Пользователь с таким именем уже существует'
            }

  validates :password, presence: { message: 'Необходимо ввести пароль' }
  has_secure_password :password, validations: false

  has_many :tasks

  validates :email,
            format: {
              with: URI::MailTo::EMAIL_REGEXP,
              message: 'email имеет некоректное значение'
            },
            uniqueness: {
              message: 'Пользователь с таким @email уже существует'
            }
end
