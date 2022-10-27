require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'the index method' do
    it 'returns http success on all users' do
      get '/'
      expect(response).to have_http_status(:success)
    end
    it "return rendered index page" do
      get '/users'
      expect(assigns(:users)).to render_template('index')
    end
    it ' shows all users' do
      get users_path
      expect(assigns(:users)).to eq(User.all)
    end
    it 'the view body is correct (index)' do
      get('/users')
      expect(response.body).to include('<div class="main">')
    end
  end

  context 'the show method' do

  end
end



