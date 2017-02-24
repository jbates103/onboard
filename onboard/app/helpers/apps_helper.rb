module AppsHelper
  def select_option(option, status)
  	return 'selected' if option == status.to_s
  end
end
