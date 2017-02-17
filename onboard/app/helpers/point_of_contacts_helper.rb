module PointOfContactsHelper
  def present_apps(own, reporting, assigned)
  	own.present? || reporting.present? || assigned.present?
  end
end
