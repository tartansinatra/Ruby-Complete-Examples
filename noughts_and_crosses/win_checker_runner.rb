require_relative('win_checker')

win_checker = WinChecker.new
empty_board = [ [nil,nil,nil],[nil,nil,nil],[nil,nil,nil] ]
symbol = :o
puts "check that empty board does not win: expect that #{win_checker.has_won?(symbol, empty_board)} is false"

board_with_horizontal = [ [:o,:o,:o],[nil,nil,nil],[nil,nil,nil] ]
puts "check that horizontal line wins does not win: expect that #{win_checker.has_won?(symbol, board_with_horizontal)} is true"