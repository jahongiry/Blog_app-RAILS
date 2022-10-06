require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Tests for Like model' do
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Teacher from Mexico.')
    first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
    subject { Like.new }
    before { subject.save }

    it 'Test if likes_counter is getting updated' do
      first_post.likes_counter = 2
      subject.post = first_post
      expect(subject.post.likes_counter).to eq 2
    end
  end
end
