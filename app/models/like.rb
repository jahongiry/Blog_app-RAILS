class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :likes_counter

  private

  def likes_counter
    post.increment!(:likes_counter)
  end
end
