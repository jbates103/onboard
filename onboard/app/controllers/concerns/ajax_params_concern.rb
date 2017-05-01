module AjaxParamsConcern
  extend ActiveSupport::Concern

  def search_term?
    return unless params.fetch(get_class_index, nil)
    params.fetch(get_class_index).fetch('search_term', nil)
  end

  def search_term
    params.fetch(get_class_index).fetch('search_term')
  end

  def lowercase_name
    search_term.to_s.downcase
  end

  def search_term_lower
    params[:search_term].to_s.downcase
  end

  def status_change_params
    { status: params[:status].to_sym }
  end

  private

  def point_of_controller_params
    params.require(:point_of_contacts).permit(:search_term)
  end

  def apps_params
    params.require(:apps).permit(:search_term)
  end

  def get_class_index
    case self.class.to_s
    when "PointOfContactsController"
      return '/point_of_contacts'
    when "AppsController"
      return '/apps'
    end
  end
end
