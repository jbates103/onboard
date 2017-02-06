require 'parser/parser'
require 'email_name_extraction'
require 'parser/indices'

class AppParser < Parser
  include EmailNameExtraction

  def populate_apps
  	while @iterator.has_next?
      @app_details = @iterator.next
      app = App.find_by_jira_ticket_id(app_details[Indices::AppParser::JIRA_TICKET])
      app = app.blank? ? create_app : update_app(app)
      update_by_find_or_create(app)
    end
  end

  protected

  attr_reader :app_details

  private

  def permitted_app_params
    {
      name: app_details[Indices::AppParser::NAME],
      jira_ticket_id: app_details[Indices::AppParser::JIRA_TICKET],
      status: @status.fetch(app_details[Indices::AppParser::STATUS]),
      resolution: app_details[Indices::AppParser::RESOLUTION],
      app_created: app_details[Indices::AppParser::APP_CREATED],
      app_updated: app_details[Indices::AppParser::APP_UPDATED],
      app_url: app_details[Indices::AppParser::APP_URL],
      due: app_details[Indices::AppParser::DUE]
    }
  end

  def create_app
    app = App.new(permitted_app_params)
    update_by_find_or_create(app)
    return app
  end

  def update_app(app)
    app.update(permitted_app_params)
    return app
  end

  def update_by_find_or_create(app)
    reporter_object = extract_poc_id(app_details[Indices::AppParser::REPORTER])
    assignee_object = extract_poc_id(app_details[Indices::AppParser::ASSIGNEE])
    app.assignee = assignee_object unless assignee_object.blank?
    app.reporter = reporter_object unless reporter_object.blank?
    app.save
  end

  def extract_poc_id(poc_email)
    return if poc_email == 'Unassigned'
    PointOfContact.exists?(email: poc_email) ? PointOfContact.find_by_email(poc_email) :
          parse_point_of_contact(poc_email).first
  end
end