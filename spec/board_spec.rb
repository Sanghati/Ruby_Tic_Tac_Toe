require 'spec_helper'

describe Board do
    
  before :each do
    @board = Board.new(3,3)
  end

  it 'should insert mark "X" from player one on board' do 
   @board.insert_mark(0,0,"X")
   expect(@board.board).to match_array([["X",nil,nil],
		 		        [nil,nil,nil],
		 		        [nil,nil,nil]])
  end

  it 'should insert mark "O" from player two on board' do
    @board.insert_mark(0,1,"O")
    expect(@board.board).to match_array([[nil,"O",nil],
		 		         [nil,nil,nil],
		 		         [nil,nil,nil]])
  end

  it 'should return true if any mark completes the left diagonal' do
    @board.board = [["X","O","O"],
	            [nil,"X","O"],
	            [nil,nil,"X"]]
    @board.is_game_over?("X").should eq(true)
  end

  it 'should return false if any mark is not completes the left diagonal' do
    @board.board = [["X","O","O"],
	            [nil,"O","X"],
	            [nil,nil,"X"]]
    @board.is_game_over?("X").should eq(false)
  end

  it 'should return true if any mark completes the right diagonal' do
    @board.board = [["O","O","X"],
	            [nil,"X","O"],
	            ["X",nil,nil]]
    @board.is_game_over?("X").should eq(true)
  end

  it 'should return false if any mark is not completes the right diagonal' do
    @board.board = [["X","O","X"],
	            [nil,"O","X"],
	            ["O",nil,"O"]]
    @board.is_game_over?("X").should eq(false)
  end

   it 'should return true if any mark completes any column' do
    @board.board = [["X","O","O"],
	            [nil,"X","O"],
	            [nil,"X","O"]]
    @board.is_game_over?("O").should eq(true)
  end

  it 'should return false if any mark is not completes any column' do
    @board.board = [["X","O","O"],
	            [nil,"O","X"],
	            [nil,nil,"X"]]
    @board.is_game_over?("O").should eq(false)
  end

  it 'should return true if any mark completes any row' do
    @board.board = [["O","O","O"],
	            [nil,"X","X"],
	            [nil,"X","O"]]
    @board.is_game_over?("O").should eq(true)
  end

  it 'should return false if any mark is not completes any row' do
    @board.board = [["X","O","O"],
	            [nil,"O","X"],
	            [nil,nil,"X"]]
    @board.is_game_over?("O").should eq(false)
  end

  it 'should return true if the board is full' do
    @board.board = [["X","O","O"],
	            ["O","O","X"],
	            ["X","X","O"]]
    @board.is_board_full?.should eq(true)
  end

  it 'should return false if the board is not full' do
    @board.board = [["X","O","O"],
	            [nil,"O","X"],
	            [nil,nil,"X"]]
    @board.is_board_full?.should eq(false)
  end

  it 'should display the board with it values' do
    @board.board = [["X","O","O"],
	            ["O","O","X"],
	            ["X","X","O"]]
    @board.to_s.should eq("X O O\nO O X\nX X O")
  end
end
