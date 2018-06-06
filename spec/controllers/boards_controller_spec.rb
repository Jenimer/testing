require 'rails_helper'
# haven't logged in a user
RSpec.describe BoardsController, type: :controller do

let (:valid_attributes) {
  { name: 'a board', body: 'somebody' }
}

let (:invalid_attributes) {
  { name: '', body: '' }
}
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a new form" do
      get :new
      
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns http success" do
      board = Board.create!
      get :show, params: { id: board.id }
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      board = Board.create!
      get :edit, params: { id: board.id  }
      expect(response).to be_successful
    end
  end


describe "PUT #update" do
  let (:new_attributes) {
    {name: 'anothername'}
  }
  
  context "with valid attributes" do
    it "updates board" do
      board = Board.create! valid_attributes
      put :update, params: { id: board.id, board: new_attributes }
      board.reload
      expect(board.name).to eq(new_attributes[:name])
    end

    it "goes to board if failed" do
      board = Board.create! valid_attributes
      put :update, params: { id: board.id, board: new_attributes }
      expect(board.name).to redirect_to(board)
    end
  end

  context "with invalid attributes" do
    it "does not update" do
      board = Board.create! invalid_attributes
    
      put :update, params: { id: board.id, board: invalid_attributes }
      board.reload
      expect(board.name).to eq(invalid_attributes[:name])
    end

    it "redirects to board" do
      board = Board.create! invalid_attributes
      put :update, params: { id: board.id, board: invalid_attributes }
      
      expect(board.name).to redirect_to(board)
    end
  end
end




describe "POST #create" do
  context "with valid attributes" do
    it "creates new board" do
      expect {
      post :create, params: { board: valid_attributes }
    }.to change(Board, :count).by(1)
  
    end

    it "redirects to board if saves" do
      post :create, params: { board: valid_attributes }
      expect(response).to redirect_to(Board)
    end
  end

  context "with invalid attributes" do
    it "does not create" do
      expect {
      post :create, params: {board: invalid_attributes}
    }.to change(Board, :count)
      
    end

    it "fails miserably and dies in a fire" do
      post :create, params: { board: invalid_attributes }
      expect(response).to redirect_to(Board)
    end
  end
end
 

describe "Delete #destroy" do
  it "deletes a board" do
    board = Board.create! valid_attributes
    expect {
    delete :destroy, params: { id: board.id }
    }.to change(Board, :count).by(-1)
  end

  it "redirects" do
    board = Board.create! valid_attributes
    delete :destroy, params: { id: board.id}
    expect(response).to redirect_to(board)
  end

end

end
