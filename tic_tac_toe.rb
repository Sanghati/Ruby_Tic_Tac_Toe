require_relative './game'
require_relative './player'

	def get_user_profile(mark = nil)
		puts "Enter the Player Name : "
		name = gets.to_s.chomp
		if mark.nil?
			puts "#{name} choose your mark (X or O) : "
			mark = gets.to_s
		end
		puts "#{name} your mark is #{mark}"
		Player.new(name, mark.chomp)
	end

	def get_user_move(player, game)
		puts "#{player.name} enter the position : "
		puts "enter the row :"
		player_row = gets.to_i
		puts "enter the column :"
		player_col = gets.to_i
		game.play(player_row,player_col,player.mark)
	end
	
		player_one = get_user_profile
		player_two = get_user_profile(player_one.mark == 'X' ? 'O' : 'X')
		game = Game.new(player_one, player_two)

	while !game.is_done? do
		get_user_move(player_one, game)
		puts game.to_s

		break if game.is_done?

		get_user_move(player_two, game)
		puts game.to_s
	end

	if game.winner 
		puts "#{game.winner.name} is won"
	else
		puts "Game is draw" 
	end
