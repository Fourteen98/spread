require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'the index method' do
    it 'returns http success on all users' do
      get '/'
      expect(response).to have_http_status(:success)
    end
    it 'return rendered index page' do
      get '/users'
      expect(assigns(:users)).to render_template('index')
    end
    it ' shows all users' do
      get users_path
      expect(assigns(:users)).to eq(User.all)
    end
    it 'the view body is correct (index)' do
      get('/users')
      expect(response.body).to include('<h1>This is for all user</h1>')
    end
  end

  context 'the show method' do
    it 'returns http success on a single user' do
      get '/users/368'
      expect(response).to have_http_status(:success)
    end
    it 'return rendered show page' do
      get '/users/368'
      expect(assigns(:user)).to render_template('show')
    end
    it ' shows a single user' do
      get user_path(368)
      expect(assigns(:user)).to eq(User.find(368))
    end
    it 'the view body is correct (show)' do
      get('/users/368')
      expect(response.body).to include('<h1>This is for a single user</h1>')
    end
  end
end
