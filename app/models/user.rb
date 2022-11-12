class User < ApplicationRecord
            validates :name,
            presence: { message: 'Имя не может быть пустым' }

  validates :password, presence: { message: 'Необходимо ввести пароль' }, on: :create
  has_secure_password :password, validations: false

  has_many :tasks
  has_many :messages

  has_one_attached :avatar
end
