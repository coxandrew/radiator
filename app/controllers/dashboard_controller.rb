class DashboardController < ApplicationController
  has_widgets do |root|
    root << widget(:motd)
  end

  def index
  end
end
