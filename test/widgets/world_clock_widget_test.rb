require 'test_helper'

class WorldClockWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:world_clock)
  end
  
  test "display" do
    render_widget :world_clock
    assert_select "h1"
  end
end
