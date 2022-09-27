require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Tests for Post model validation ' do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

    subject { Post.new(author: user, title: 'Project', text: 'DESC') }
    before { subject.save }

    it 'title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'title should not be blank' do
      subject.title = ''
      expect(subject).to_not be_valid
    end

    it 'title should not exceed 250 characters' do
      subject.title = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.
             Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer
             took a galley of type and scrambled it to make a type specimen book.
              It has survived not only five centuries"
      expect(subject).to_not be_valid
    end

    it 'text should be less than 500 characters' do
      subject.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.
            Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer
            took a galley of type and scrambled it to make a type specimen book.
            It has survived not only five centuries"
      expect(subject).to_not be_valid
    end

    it 'comments counter should be greater than or equal than 0' do
      subject.comments_conter = -3
      expect(subject).to_not be_valid
    end

    it 'likes counter should be greater than or equal than 0' do
      subject.likes_counter = -3
      expect(subject).to_not be_valid
    end
  end

  describe 'Tests for Post model methods' do
    test_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    before { 10.times { Comment.create(post_id: subject, author: test_user, text: 'Hola Tom!') } }

    it '#five_recent_comments should return 5 comments' do
      expect(subject.five_recent_comments.size).to eql(subject.comments.last(5).size)
    end
  end
end
