class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_post_comments_count

  def update_post_comments_count
    post.increment!(:comments_conter)
  end
end
