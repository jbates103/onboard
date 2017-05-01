require 'parser/parser'
require 'parser/email_name_extraction'
require 'parser/indices'

class AppDetailsParser < Parser
  include EmailNameExtraction

  def populate_apps
    apps = Array.new
    while @iterator.has_next? do
      @app_details = @iterator.next
      app = App.find_by_name(app_details[Indices::AppDetailsParser::NAME])
      if app
        apps << update_app(app)
        next
      elsif app_details[Indices::AppDetailsParser::NAME].present?
        apps << create_app 
        update_associations(apps.last)
        next
      end
      apps.last.descriptions << description if apps.last
    end  
  end

  protected

  attr_reader :app_details

  private

  def description
    Description.create(text: app_details[Indices::AppDetailsParser::DESCRIPTION])
  end

  def create_app
    App.create(
        name: app_details[Indices::AppDetailsParser::NAME],
        app_url: app_details[Indices::AppDetailsParser::APP_URL],
        status: @status.fetch(app_details[Indices::AppDetailsParser::STATUS]),
        app_updated: app_details[Indices::AppDetailsParser::APP_UPDATED],
        epic: app_details[Indices::AppDetailsParser::EPIC]
        )
  end

  def update_app(app)
    app.update_columns(epic: app_details[Indices::AppDetailsParser::EPIC])
    update_associations(app)
  end


  def update_associations(app)
    if app && app_details[Indices::AppDetailsParser::DESCRIPTION].present?
      app.descriptions = [description]
    end

    if app && app_details[Indices::AppDetailsParser::OWNER].present?
      app.point_of_contacts = parse_point_of_contact(app_details[Indices::AppDetailsParser::OWNER])
    end
    app.save
    return app
  end

end