class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many_attached :images, dependent: :destroy
    validates :title, presence: true
    validates :text, presence: true

    mount_uploader :image, ImageUploader
    validates :image, file_size: { less_than: 5.megabytes }
end
