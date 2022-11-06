class Comment < ApplicationRecord
  belongs_to :article, dependent: :destroy
  
  has_one_attached :image, dependent: :destroy
end
