require 'test_helper'

class EpicsWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:epics)
  end
  
  test "display" do
    render_widget :epics
    assert_select "h1"
  end
end
