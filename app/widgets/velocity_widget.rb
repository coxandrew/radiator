require 'pivotal-tracker'

class VelocityWidget < Apotomo::Widget
  PivotalTracker::Client.token = CONNECTORS_CONFIG["pivotal"]["api_key"]

  def display
    puts "++ PROJECT_ID: #{project_id}"
    firefly = PivotalTracker::Project.find(project_id)
    @velocity = firefly.current_velocity
    render
  end

  def project_id
    CONNECTORS_CONFIG["pivotal"]["projects"]["firefly"]["id"]
  end
end
