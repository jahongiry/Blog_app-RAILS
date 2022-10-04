# require 'rails_helper'

# RSpec.describe 'UsersController', type: :request do
#   context 'GET index' do
#     before(:example) do
#       get '/users'
#     end

#     it 'Should be 200' do
#       expect(response).to have_http_status(:ok)
#     end

#     it 'should render a template' do
#       expect(response).to render_template(:index)
#     end

#     it 'should test placeholder text inside template' do
#       expect(response.body).to include('Users List')
#     end
#   end

#   context 'GET show' do
#     before(:example) { get '/users/3' }

#     it 'Should be 200' do
#       expect(response).to have_http_status(:ok)
#     end

#     it 'should render a template' do
#       expect(response).to render_template(:show)
#     end

#     it 'should test placeholder text inside template' do
#       expect(response.body).to include('User details by ID')
#     end
#   end
# end
