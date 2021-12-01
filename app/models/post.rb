class Post < ApplicationRecord
  belongs_to :user

  validates_presence_of   :title, :body, :user_id
  has_rich_text :body
  has_one_attached :photo

end
