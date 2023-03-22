require_relative "image_handler"
include ImageHandler

# Define command
COMMAND = {
  "I" => :create,
  "C" => :clear,
  "L" => :color_pixel,
  "V" => :draw_vertical_segment,
  "H" => :draw_horizontal_segment,
  "F" => :fill_region,
  "S" => :show_image,
  "X" => :terminate
}

# Terminate the session
def terminate
  puts "See you later!"
  exit
end

# Read input
loop do
  print "> "
  line = gets.chomp
  command, *args = line.split
  command = COMMAND[command]
  send(command, *args)
end
