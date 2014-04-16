require_relative './board'
class Game

	attr_reader :player_one, :player_two, :winner, :done, :board
	
	def initialize(player_one, player_two)
		@board = Board.new(3,3)
		@player_one = player_one
		@player_two = player_two
		@done = false
		@winner = nil
	end
	
	def play(x,y,mark)
		board.insert_mark(x, y, mark)
		if board.is_complete?(mark)
			#winner
			@done = true
			win(mark)
		elsif board.is_full?
			# Draw
			@done = true
		end
	end

	def win(mark)
		if player_one.mark == mark
			@winner = player_one
		elsif player_two.mark == mark
			@winner = player_two
		end
	end

	def is_done?
		done
	end

	def to_s
		board.to_s	
	end	
end
