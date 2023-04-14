class Game
  attr_accessor :game_over

  def initialize
    @game_over = false
  end

  def play
    until game_over
      move = get_player_move
      if move.command?
        execute_command(move.command)
      else
        make_move
      end
      game_over?
      change_player
    end
  end
end
