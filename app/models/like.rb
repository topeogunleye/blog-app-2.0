class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_likes_counter

  def update_likes_counter
    Post.increment!(:likes_counter)
  end
end