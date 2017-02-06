require 'csv_iterator'

class Parser
  autoload :Exceptions, 'exceptions'
  
  def initialize(file_name)
  	@file_name = file_name
    @iterator = CsvIterator.new(file_name)
    @status = status_of_app
  end

  protected

  def columns
  	raise Exceptions::MethodNotImplemented
  end

  def status_of_app
    {
      'NOT STARTED' => 0,
      'IN PROGRESS' => 1, 
      'BLOCKED' => 2, 
      'COMPLETED' => 3, 
      'DONE' => 4,
      'ACCEPTED' => 5 
    }
  end
end