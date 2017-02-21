module SearchTermConcern
  extend ActiveSupport::Concern

  def search_term?
    return unless params.fetch('/apps', nil)
    params.fetch('/apps').fetch('search_term', nil)
  end

  def search_term
    params.fetch('/apps').fetch('search_term')
  end

  def lowercase_name
    params.fetch(:search_term).to_s.downcase
  end
end
