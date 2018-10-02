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

  def define_start(year, month, day)
    leave_start = Date.new(year, month, day)
    return unless leave_start > Date.today

    @information[:leave_start] = leave_start
  end

  def define_finish(length)
    return unless length > 0

    @information[:leave_finish] = @information[:leave_start] + length
  end

  def info(symbol)
    @information.fetch(symbol.to_sym)
  end
end
