require 'test_helper'

class CalendarWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:calendar)
  end
  
  test "display" do
    render_widget :calendar
    assert_select "h1"
  end
end
