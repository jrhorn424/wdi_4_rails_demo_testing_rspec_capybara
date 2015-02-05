require 'rails_helper'

RSpec.describe CommentsController do
  let(:article_params) {
    { title: 'One Stupid Trick', body: "You won't believe what happens next..." }
  }

  describe 'GET index' do
    it 'has a 200 status code' do
      article = Article.create!(article_params)

      get :index, article_id: article

      expect(response.status).to eq 200
    end

    it 'assigns @comments' do
      article = Article.create!(article_params)
      comments = article.comments

      get :index, article_id: article

      expect(assigns(:comments)).to eq comments
    end
  end
end
