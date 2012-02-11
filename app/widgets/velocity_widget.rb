require 'pivotal-tracker'

class VelocityWidget < Apotomo::Widget
  responds_to_event :load, :with => :display_ajax

  PivotalTracker::Client.token = APP_CONFIG["pivotal"]["api_key"]

  def display
    render
  end

  def display_ajax
    @velocity = PivotalTracker::Project.find(project_id).current_velocity
    replace :view => :display
  end

  def project_id
    APP_CONFIG["pivotal"]["projects"]["firefly"]["id"]
  end
end
