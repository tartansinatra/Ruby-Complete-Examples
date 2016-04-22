class Game

  def initialize(win_checker)
    @board = [ [nil,nil,nil],[nil,nil,nil],[nil,nil,nil] ]
    @pieces = [:o, :x]
    @turn = 0
    @win_checker = win_checker
  end

  def display_board
    row_strings = @board.map do |row|
      row_to_string(row)
    end
    row_strings.join("\n_ _ _\n")
  end

  def place_piece(row, column)
    if out_of_range?(row, column)
      puts "Invalid move"
      return
    end
    if @board[ row ][ column ]
      puts "Already a piece there"
      return false
    end
    @board[ row ][ column ] = current_piece   
  end

  def turn(row, column)
    place_piece(row, column)
    puts display_board
    check_for_win()   
  end

  def current_piece
    @pieces[ @turn % 2 ]
  end

  def check_for_win
    if @win_checker.has_won?(current_piece, @board)
      puts "Winner is #{current_piece}"
      new_game
    elsif board_full?
      puts "Full board play again"
      new_game
    else
      @turn = @turn + 1
    end  
  end

  def new_game
    @board = [ [nil,nil,nil],[nil,nil,nil],[nil,nil,nil] ]
    @turn = 0
    @pieces.rotate!
  end

  private
    def board_full?
      @turn == 9
    end
    def out_of_range?(row, column)
      row >= 3 || column >= 3
    end
    def row_to_string(row)
      row_symbols = row.map do |piece|
        piece || " "
      end
      row_symbols.join("|")
    end
end