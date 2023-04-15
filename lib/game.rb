require 'require_all'
require_relative 'player'
require_relative 'board'
require_relative 'move'
require_relative 'movement'
require_relative 'saveload'
require_relative 'piece'
require_rel 'pieces'

class Game
  include SaveLoad
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
        execute_command(move.command.downcase)
        redo
      elsif !move.valid?(board) || board.piece_at(move.origin).color != current_player.color
        puts 'Invalid move.'
        redo
      end
      make_move(move)
      ending if game_over?
      change_player
    end
  end

  private

  def ending
    puts board
    if game_over == :win
      puts "#{current_player.color.to_s.capitalize} wins by checkmate!"
    else
      puts 'something else happened'
    end
    exit
  end

  def execute_command(cmd)
    if %w[quit exit].include?(cmd)
      exit
    elsif cmd == 'save'
      save_game
    elsif cmd == 'load'
      load_game
    else
      puts 'Unrecognized command.'
    end
  end

  def make_move(move)
    piece = board.piece_at(move.origin)
    piece.move_history.push(move)
    piece.update_position
    board.board[move.destination] = piece
    board.board.delete(move.origin)
    # Clear en passant piece if necessary
  end

  def game_over?
    if checkmate?
      @game_over = :win
      true
    # game_over = :tie if game_tied?
    else
      false
    end
  end

  def checkmate?
    board.kings.each do |king|
      return true if king.in_check? && king.move_range.empty?
    end
    false
  end

  def change_player
    @current_player = if @current_player.equal? @white_player
                        @black_player
                      else
                        @white_player
                      end
  end
end
