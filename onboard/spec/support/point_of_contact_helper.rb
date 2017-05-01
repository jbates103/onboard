module PointOfContactHelper
  def params_without_first
    {
	 last_name: 'last_name',
	 email: 'no_first@gmail.com',
	 phone: '999-999-9999',
	 department: 'no_department'
	 }
  end

  def params_without_last
	{
	 first_name: 'first_name',
	 email: 'no_last@gmail.com',
	 phone: '999-999-9999',
	 department: 'no_department'
    }
  end

  def params_without_email
	{
	 first_name: 'first_name',
	 last_name: 'last_name',
	 phone: '999-999-9999',
	 department: 'no_department'
	}
  end

  def valid_params
	{
	 first_name: 'first_name',
	 last_name: 'last_name',
	 email: 'valid@gmail.com'
	}
  end

  def all_params
	{
	 first_name: 'first_name',
	 last_name: 'last_name',
	 email: 'no_last@gmail.com',
	 phone: '999-999-9999',
	 department: 'no_department'
    }
  end
end