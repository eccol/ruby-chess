class Player
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def move
    loop do
      puts "#{color.to_s.capitalize} Player, select a square (or enter command)."
      input = player_input
      return Move.new({ command?: true, command: input }) unless move_format?(input)

      piece_origin = input
      puts 'Select a destination.'
      piece_destination = player_input
      if move_format?(piece_destination)
        move = Move.new(piece_origin, piece_destination)
        break if move.valid?
      end

      puts 'Invalid move.'
    end
    move
  end

  private

  def player_input
    gets.chomp
  end

  def move_format?(input)
    return false if input.length != 2

    col = input[0].downcase
    row = input[1].to_i
    return false unless ('a'..'h').include?(col)
    return false unless row >= 1 && row <= 8

    true
  end
end
