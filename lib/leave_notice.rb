# Paid time off from work due to sickness/vacation
class LeaveNotice
  def initialize(name, last_name, leave_type)
    @information = { start: nil,
                     finish: nil }
    @information[:id] = self
    @information[:name] = name
    @information[:last_name] = last_name
    @information[:type] = leave_type
  end

  def define_start(date)
    @information[:start] = date if date > Date.today
  end

  def define_finish(length)
    @information[:finish] = @information[:start] + length if length > 0
  end

  def info(symbol)
    @information.fetch(symbol.to_sym)
  end
end
