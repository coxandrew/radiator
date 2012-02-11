## Welcome to The Pulse!

The Pulse is a flexible, pluggable status dashboard built on top of [Rails](http://rubyonrails.org) and [apotomo](http://apotomo.de). It's designed for ease of use and beauty!

## Getting started

Copy `config/config.yml.example` to `config/config.yml` and fill in your own configuration details.

## Create a new widget

Start by creating a Velocity widget:

    ∴ rails generate apotomo:widget velocity
        invoke  erb
        invoke  test_unit
        create    test/widgets/velocity_widget_test.rb
        create  app/widgets/velocity_widget.rb

Now add a `display` method to the newly-created `VelocityWidget` class (getting the actual Velocity is an exercise left for the reader):

    class VelocityWidget < Apotomo::Widget
      def display
        @velocity = 26
        render
      end
    end

Add the `velocity` widget to your Dashboard controller:

    class DashboardController < ApplicationController
      has_widgets do |root|
        root << widget(:motd)
        root << widget(:velocity)
      end

      def index
      end
    end

Create `velocity/display.html.erb` in the `app/widgets` directory to display the Velocity widget:

    <div id="widget_velocity" class="grid_4 widget">
      <div class="inside">
        <h2>Velocity</h2>
        <div class="velocity">
          <%= @velocity %>
        </div>
      </div>
    </div>

That's it! For static widgets that are just radiating information, now you just need to figure out how to get the data you need from 3rd party APIs.