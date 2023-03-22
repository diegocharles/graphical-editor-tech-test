module ImageHandler
  # Create a new image instance
  def create(width, heigth)
    width, heigth = width.to_i, heigth.to_i
    @image = Array.new(heigth) { Array.new(width, 'O') }
  end

  # Clear the image
  def clear
    @image.each { |row| row.fill('O') }
  end

  # Color a pixel
  def color_pixel(x, y, color)
    x, y = x.to_i, y.to_i
    @image[y - 1][x - 1] = color
  end

  # Draw a vertical segment
  def draw_vertical_segment(x, y1, y2, color)
    x, y1, y2 = x.to_i, y1.to_i, y2.to_i
    (y1..y2).each { |y| @image[y-1][x-1] = color }
  end

  # Draw a horizontal segment
  def draw_horizontal_segment(x1, x2, y, color)
    x1, x2, y = x1.to_i, x2.to_i, y.to_i
    (x1..x2).each { |x| @image[y-1][x-1] = color }
  end

  # Fill a region
  def fill_region(x, y, color)
    x, y = x.to_i, y.to_i
    fill(x, y, color, @image[y-1][x-1])
  end

  # Recursive fill
  def fill(x, y, color, old_color)
    x, y = x.to_i, y.to_i
    return if out_of_bounds?(y, x) || @image[y][x] != old_color

    @image[y][x] = color
    fill(y + 1, x, color, old_color)
    fill(y - 1, x, color, old_color)
    fill(y, x + 1, color, old_color)
    fill(y, x - 1, color, old_color)
  end

  # Show the image
  def show_image
    puts @image.map { |row| row.join }
  end

  private

  # Check if a pixel is out of bounds
  def out_of_bounds?(x, y)
    x < 0 || y < 0 || x > @image.length - 1 || y > @image[0].length - 1
  end
end
