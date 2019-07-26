require 'rails_helper'

RSpec.describe WordsController, type: :controller do

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  context 'when no words are assigned' do
   it 'assigns @words' do
      get :index
      expect(assigns(:words)).to eq([])
    end
  end
  
  context 'when some words are assigned' do
    it 'assigns @words' do
      word = Word.create
      get :index
      expect(assigns(:words)).to eq([word])
    end
  end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

end
