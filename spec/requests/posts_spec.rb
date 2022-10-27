require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'the index method' do
    it 'returns http success on all posts' do
      get '/'
      expect(response).to have_http_status(:success)
    end
    it "return rendered index page" do
      get '/users/1/posts'
      expect(assigns(:posts)).to render_template('index')
    end
    it ' shows all posts' do
      get '/users/1/posts'
      expect(assigns(:posts)).to eq(Post.all)
    end
    it 'the view body is correct (index)' do
      get('/users/1/posts')
      expect(response.body).to include('<h1>Posts#index</h1>')
    end
  end

  context 'the show method' do
    it 'returns http success on a single post' do
      get '/users/1/posts/2'
      expect(response).to have_http_status(:success)
    end
    it "return rendered show page" do
      get '/users/1/posts/2'
      expect(assigns(:post)).to render_template('show')
    end
    it ' shows a single post' do
      get '/users/1/posts/2'
      expect(assigns(:post)).to eq(Post.find(1))
    end
    it 'the view body is correct (show)' do
      get('/users/1/posts/2')
      expect(response.body).to include('<h1>Posts#show</h1>')
    end
  end
end
