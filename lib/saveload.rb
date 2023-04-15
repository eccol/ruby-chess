require 'yaml'

module SaveLoad
  def save_game
    Dir.mkdir('saves') unless Dir.exist?('saves')
    saves = Dir.children('saves')
    puts 'Name of save:'
    filename = gets.chomp
    if saves.include?(filename)
      puts "A save called #{filename} already exists. Overwrite? Y/N"
      overwrite = gets.chomp
      return if overwrite.upcase == 'N'
    end
    File.open('./saves/' + filename, 'w') do |save_file|
      save_file.puts YAML.dump(self)
    end
  end

  def load_game
    unless Dir.exist?('saves')
      puts 'Save folder not found.'
      return
    end
    puts 'Pick a file to load:'
    saves = Dir.children('saves')
    saves.each_with_index do |save, i|
      puts "#{i + 1}. #{save}"
    end
    selection = gets.chomp.to_i - 1
    if saves[selection].nil?
      puts 'Save not found.'
      return
    end
    save_data = YAML.unsafe_load_file('./saves/' + saves[selection])
    save_data.play
    exit
  end
end
