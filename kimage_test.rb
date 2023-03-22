require 'test/unit'
require_relative 'image_handler'

class KimageTest < Test::Unit::TestCase
  include ImageHandler
  def test_input
    create("5", "6")
    color_pixel("2", "3", "A")
    show_image
  end

  def test_output
    assert_equal("OOOOO

OOOOO

OAOOO

OOOOO

OOOOO

OOOOO", show_image)
  end
end
