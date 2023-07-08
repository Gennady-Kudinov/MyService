class Article < ApplicationRecord
    has_many :comments
    
    has_many_attached :files, dependent: :destroy
    has_many_attached :images, dependent: :destroy
    has_one_attached :video, dependent: :destroy
end
