module Exceptions
  class FileNotAcceptedError < StandardError
  end

  class FileNotFoundError < StandardError
  end

  class MethodNotImplemented < StandardError
  end
end