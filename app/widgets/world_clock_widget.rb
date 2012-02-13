require 'ostruct'

class WorldClockWidget < Apotomo::Widget
  def display
    set_times
    render
  end

  private

  def set_times
    clock_cities = APP_CONFIG["world_clock"]["cities"]
    @cities = Array.new
    clock_cities.each_pair do |city, offset|
      @cities << OpenStruct.new(
        :name => city.gsub("_", " ").gsub(/\b\w/){$&.upcase},
        :time => Time.now.localtime(offset)
      )
    end
  end
end
