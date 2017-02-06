module EmailNameExtraction

  SEMI_COLON = ';'
  PERIOD = '.'
  AT_ADDRESS = '@'
  MIDDLE_INITIAL = 1
  ONLY_FIRST_AND_LAST = 2

  
  def parse_point_of_contact(owners_emails)
    return if owners_emails.blank?
    poc_objects = Array.new
    emails = owners_emails.split(SEMI_COLON)
    emails.each do |email|
      names = email.partition(AT_ADDRESS).first.split(PERIOD)
      poc = PointOfContact.find_or_create_by!(poc_params(names, email))
      poc_objects << poc
    end
    poc_objects
  end

  private


  def poc_params(names, email)
    {
      email: email,
      first_name: names.first.capitalize,
      last_name: names.last.capitalize
    }
  end
end