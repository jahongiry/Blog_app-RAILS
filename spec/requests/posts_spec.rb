require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  context 'GET index' do
    before(:example) do
      get '/users/3/posts'
    end

    it 'returns a 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    before(:example) do
      get '/users/3/posts/6'
    end
  end
end
