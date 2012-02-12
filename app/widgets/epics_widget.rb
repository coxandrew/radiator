require "ostruct"
require "pivotal-tracker"
require "pp"

PivotalTracker::Client.token = APP_CONFIG["pivotal"]["api_key"]

class Epic
  attr_reader :label, :name

  def initialize(options = {})
    @project    = options[:project]
    @label      = options[:label]
    @name       = options[:name]
  end

  def percent_complete
    (points_completed.to_f / points_total.to_f * 100).floor
  end

  def points_completed
    completed_features = @project.stories.all(
      :label => @label,
      :story_type => 'feature',
      :current_state => 'accepted',
      :includedone => true
    )
    completed_features.inject(0) {|sum, n| sum + n.estimate }
  end

  def points_total
    all_features = @project.stories.all(
      :label => @label,
      :story_type => 'feature',
      :includedone => true
    )
    all_features.inject(0) {|sum, n| sum + n.estimate }
  end
end

class EpicsWidget < Apotomo::Widget
  def display
    get_epics
    render
  end

  def get_epics
    @epics = Array.new
    project_config = APP_CONFIG["pivotal"]["projects"]["firefly"]
    epics = project_config["epics"]
    epics.keys.each do |label|
      epic = Epic.new(
        :project => PivotalTracker::Project.find(project_config["id"]),
        :label   => label,
        :name    => epics[label]["name"]
      )
      pp epic
      @epics << epic
    end
  end
end
