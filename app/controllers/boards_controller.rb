class BoardsController < ApplicationController
  before_action :set_board only: [:destroy, :edit, :show, :update]
  
  def index
    @boards = Boards.all
  end

  def new
    @board = Boards.new
    render :form
  end

  def show
  end

  def edit
    render :form
  end

  def create
      @boards.new(board_params)
      if @board.save
        redirect_to new_board_path
      else
        render :form
  end

  def update
    if @board.update(board_params)
      redirect_to @board
    else
      render :form
  end

  def destroy
    @board.destroy
    redirect_to boards_path
  end

  private
    def set_board
      @board = Board.find(params[:id])
    end

    def board_params
      params.require(:board).permit(:name, :body)
    end

end
