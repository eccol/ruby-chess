class Move
  attr_reader :origin, :destination, :is_command, :command

  def initialize(origin, destination, is_command = false, command = nil)
    @origin = origin
    @destination = destination
    @is_command = is_command
    @command = command
  end

  def command?
    is_command
  end
end
