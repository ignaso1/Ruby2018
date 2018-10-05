# Paid time off from work due to sickness/vacation
class LeaveNotice
  def initialize(name, last_name, leave_type)
    @information = { leave_start: nil,
                     leave_finsih: nil }
    @information[:leave_id] = self
    @information[:name] = name
    @information[:last_name] = last_name
    @information[:leave_type] = leave_type
  end

  def define_start(date)
    @information[:leave_start] = date if date > Date.today
  end

  def define_finish(length)
    @information[:leave_finish] = @information[:leave_start] + length if length > 0
  end

  def info(symbol)
    @information.fetch(symbol.to_sym)
  end
end
