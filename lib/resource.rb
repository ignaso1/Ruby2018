# Resource class used to respresent human resources
class Resource
  attr_reader :leave_notices, :comments, :information
  def initialize(name, last_name)
    @information = { position: nil, salary: nil,
                     birthday: nil }
    @information[:resource_id] = self
    @information[:name] = name
    @information[:last_name] = last_name
    @comments = []
    @leave_notices = []
  end

  def info(symbol)
    @information.fetch(symbol.to_sym)
  end
end
