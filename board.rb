class Board

	attr_accessor :cols, :rows, :board
	def initialize(rows,cols)
		@rows = rows
		@cols = cols
		@board = Array.new(rows) { Array.new(cols) }
	end
	
	def insert_mark(row,col,value)
		@board[row][col]= value
	end

	def is_left_diagonal?(mark)
		left_diagonal_values = []
		(0...rows).each do |i|
			left_diagonal_values << @board[i][i]
		end
		return isdone(left_diagonal_values, mark)			
	end
	
	def is_right_diagonal?(mark)
		right_diagonal_values = []
		(0...rows).each do |x| 
			right_diagonal_values << @board[x][@board[x].length-x-1]
		end
		return isdone(right_diagonal_values, mark)
	end

	def is_column?(col, mark)
		column_values = []
		(0...rows).each do |x|
			column_values << @board[x][col]
		end
		return isdone(column_values,mark)
	end

	def is_row?(row,mark)
		row_values = []
		(0...cols).each do |y|
			row_values << @board[row][y]
		end
		return isdone(row_values,mark)
	end

	def any_column?(mark)
		(0...cols).any? do |col|
			is_column?(col, mark)
		end
	end

	def any_row?(mark)
		(0...rows).any? do |row|
			is_row?(row, mark)
		end
	end

	def is_full?
		(0...rows).all? {|r| @board[r].compact.size == cols}
	end
	
	def is_complete?(mark)
		return is_left_diagonal?(mark) || is_right_diagonal?(mark) || any_column?(mark) || any_row?(mark)
	end

	def isdone(arr, xo)
		arr.size == 3 && arr.all? {|v| v == xo}
	end

	def to_s
		(0...rows).map do |row|
			(0...cols).map do |col|
				@board[row][col] || '_'
			end.join(' ')
		end.join("\n")
	end
end
