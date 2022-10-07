require 'rails_helper'
RSpec.describe 'Post index', type: :feature do
  before(:each) do
    # rubocop: disable Layout/LineLength

    @first_user = User.create(name: 'Tom',
                              photo: 'https://www.thoughtco.com/thmb/0I-Uw-0rcc6MUzcZJauNGKR9JzA=/768x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/male-computer-programmer-using-laptop-at-desk-in-office-755650739-5c5bb32346e0fb0001f24d3d.jpg', bio: 'Teacher from Mexico.', posts_counter: 0)
    # rubocop: enable Layout/LineLength

    @first_post = Post.create(author: @first_user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                              likes_counter: 0)
    @second_post = Post.create(author: @first_user, title: 'Hola', text: 'This is my second post', comments_counter: 0,
                               likes_counter: 0)
    @third_post = Post.create(author: @first_user, title: 'Honjour', text: 'This is my third post',
                              comments_counter: 0, likes_counter: 0)
    @fourth_post = Post.create(author: @first_user, title: 'Salam', text: 'This is my fourth post',
                               comments_counter: 0, likes_counter: 0)

    @first_comment = Comment.create(post: @first_post, author: @first_user, text: 'Hi Tom!')
    @second_comment = Comment.create(post: @first_post, author: @first_user,
                                     text: 'Hola Tom!')
    @third_comment = Comment.create(post: @first_post, author: @first_user,
                                    text: 'Salam Tom!')
    @fourth_comment = Comment.create(post: @first_post, author: @first_user,
                                     text: 'Bonjour Tom!')
    @fifth_comment = Comment.create(post: @first_post, author: @first_user,
                                    text: 'Hello Tom!')
    @sixth_comment = Comment.create(post: @first_post, author: @first_user,
                                    text: 'Hi hola Tom!')

    visit user_posts_path(@first_user)
  end
  describe 'post index page' do
    it 'shows the user profile picture' do
      expect(page).to have_xpath("//img[contains(@src,'https://www.thoughtco.com/thmb/0I-Uw-0rcc6MUzcZJauNGKR9JzA=/768x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/male-computer-programmer-using-laptop-at-desk-in-office-755650739-5c5bb32346e0fb0001f24d3d.jpg')]")
    end

    it 'shows the username' do
      expect(page).to have_content @first_user.name
    end

    it 'shows the number of posts each user has written' do
      expect(@first_user.posts_counter).to eq(4)
    end

    it 'shows the post\'s title' do
      expect(page).to have_content @first_post.title
      expect(page).to have_content @second_post.title
      expect(page).to have_content @third_post.title
      expect(page).to have_content @fourth_post.title
    end

    it 'shows some of the post\'s body' do
      expect(page).to have_content 'first post'
      expect(page).to have_content 'second post'
      expect(page).to have_content 'third post'
      expect(page).to have_content 'fourth post'
    end

    it 'shows the first comments on a post' do
      expect(page).to have_content @first_comment.text
    end

    it 'shows how many comments a post has' do
      expect(@first_post.comments_counter).to eq(6)
    end

    it 'shows a section for pagination if there are more posts than fit on the view' do
      expect(page).to have_content 'Pagination'
    end

    it 'When I click on a post, it redirects me to that post\'s show page' do
      click_link @first_post.title
      expect(page).to have_current_path user_post_path(@first_user, @first_post)
    end
  end
end

# I can see the first comments on a post.
# I can see how many comments a post has.
# I can see how many likes a post has.
# I can see a section for pagination if there are more posts than fit on the view.
# When I click on a post, it redirects me to that post's show page.
