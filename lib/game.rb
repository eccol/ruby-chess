class Game
  attr_reader :current_player
  attr_accessor :game_over

  def initialize
    @white_player = Player.new(:white)
    @black_player = Player.new(:black)
    @current_player = @white_player
    @game_over = false
  end

  def play
    until game_over
      move = current_player.get_move
      if move.command?
        execute_command(move.command)
      else
        make_move
      end
      game_over?
      change_player
    end
  end

  private

  def make_move
    # Make the actual move on the board
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
