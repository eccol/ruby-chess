require 'require_all'
require_relative 'player'
require_relative 'board'
require_relative 'move'
require_relative 'piece'
require_rel 'pieces'

class Game
  attr_reader :current_player, :board
  attr_accessor :game_over

  def initialize
    @white_player = Player.new(:white)
    @black_player = Player.new(:black)
    @current_player = @white_player
    @game_over = false
    @board = Board.new
  end

  def play
    until game_over
      puts board
      move = current_player.move
      if move.command?
        execute_command(move.command)
      elsif !move.valid?(board)
        puts 'Invalid move.'
        redo
      end
      make_move(move)
      # game_over?
      change_player
    end
  end

  private

  def make_move(move)
    piece = board.piece_at(move.origin)
    piece.move_history.push(move)
    piece.update_position
    board.board[move.destination] = piece
    board.board.delete(move.origin)
    # Clear en passant piece if necessary
  end

  def game_over?
    game_over = :win if player_wins?
    game_over = :tie if game_tied?
    game_over = false
  end

  def change_player
    @current_player = if @current_player.equal? @white_player
                        @black_player
                      else
                        @white_player
                      end
  end
end
