module ApplicationHelper


  def bootstrap_class_for flash_type
    case flash_type
      when "success"
        "alert-success"
      when "notice"
        "alert-info"
      when "info"
        "alert-info"
      when "warning"
        "alert-warning"
      when "error"
        "alert-danger"
      else
        "alert-danger"
    end
  end

end
