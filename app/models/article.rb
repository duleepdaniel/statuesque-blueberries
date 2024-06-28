class Article < ApplicationRecord
    validates :title, :content, :author, :category, :published_at, presence: true
    validates :title, length: { maximum: 40 }
end
