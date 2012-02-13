class CalendarWidget < Apotomo::Widget
  def display
    @events = CalendarEvent.all(:order => "date asc")
    render
  end
end
