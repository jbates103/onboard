require 'csv'

class CsvIterator
  autoload :Exceptions, 'exceptions'

  def initialize(file)
  	@file_name = file
  	@csv_array = CSV.read(@file_name)
  	@count = @csv_array.size
  	@index = 1
  end

  def has_next?
  	raise Exceptions::FileNotAcceptedError unless has_file?
  	index < count
  end

  def has_previous?
  	raise Exceptions::FileNotAcceptedError unless has_file?
  	index > 1
  end

  def next
    value = has_next? ? csv_array[index] : nil
    @index+= 1 if value.present?
    value
  end

  def previous
  	return nil unless has_previous?
  	@index-= 1
  	csv_arry[index]
  end

  def is_done?
  	raise Exceptions::FileNotAcceptedError unless has_file?
  	index == count
  end

  def accept_new_file(file=nil)
  	file_name = file
  	csv_array = CSV.read(file_name)
  	count = csv_array.size
  	index = 1
  end

  def reset_head
  	index = 1
  end

  private

  attr_accessor :index, :count, :file_name, :csv_array

  def has_file?
  	@file_name.present?
  end
end