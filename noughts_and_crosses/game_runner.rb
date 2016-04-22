require('pry-byebug')
require_relative('game')
require_relative('win_checker')
require_relative('rubbish_win_checker')

#create game
win_checker_1 = WinChecker.new()
rubbish = RubbishWinChecker.new()

game = Game.new(rubbish)

#place piece
game.turn(0,0)
#display board
puts game.display_board
#TODO Reset board
game.new_game


binding.pry;''