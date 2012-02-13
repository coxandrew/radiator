class DashboardController < ApplicationController
  has_widgets do |root|
    root << widget(:motd)
    root << widget(:epics)
    root << widget(:velocity)
    root << widget(:world_clock)
    root << widget(:calendar)
  end

  def index
  end
end
