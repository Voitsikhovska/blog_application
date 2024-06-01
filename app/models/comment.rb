class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  # link, text, list, image...
  has_rich_text :body
end
