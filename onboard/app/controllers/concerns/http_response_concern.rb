module HttpResponseConcern
  extend ActiveSupport::Concern

  def render_401
  	render file: 'public/401.html', layout: false, status: 401
  end

end