require 'spec_helper'

describe Game do
 
  before :all do
    @board = Board.new(3,3)
    @board.board = [["X","O","O"],
	            [nil,"X","O"],
	            [nil,nil,nil]]
    @player_one = Player.new("sanghati","X")
    @player_two = Player.new("max","O")
  end

  before :each do
    @game = Game.new(@player_one,@player_two)
  end

  it 'should play the game for player one and declare player one as winner' do
    @game.play(2,2,"X").should eq(@game.winner)
  end

  it 'should play the game for player two and declare player two as winner' do
    @game.play(2,2,"O").should eq(@game.winner)
  end
end
