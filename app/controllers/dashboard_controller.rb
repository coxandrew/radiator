class DashboardController < ApplicationController
  has_widgets do |root|
    root << widget(:motd)
    root << widget(:velocity)
  end

  def index
  end
end
