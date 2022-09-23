class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :comment_counter

  private

  def comments_counter
    post.increment!(:comments_counter)
  end
end
