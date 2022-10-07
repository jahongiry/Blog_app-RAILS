require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Tests for Comment model' do
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Teacher from Mexico.')
    first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
    subject { Comment.new }
    before { subject.save }

    it 'Test if comments_counter is getting updated' do
      first_post.comments_counter = 2
      subject.post = first_post
      expect(subject.post.comments_counter).to eq 2
    end
  end
end
