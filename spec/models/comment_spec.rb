require 'rails_helper'

RSpec.describe Comment, type: :model do
  # describe 'Association Test' do
  #   it { should belong_to(:author) }
  #   it { should belong_to(:post) }
  # end

  describe 'Tests Comment model' do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    post = Post.create(author: user, title: 'Hello', text: 'This is my first post')

    subject { Comment.new }
    before { subject.save }

    it 'Test comments_counter' do
      post.comments_conter = 3
      subject.post = post
      expect(subject.post.comments_conter).to eq 3
    end
  end
end
