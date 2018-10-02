# Class for Potential Resource
class PotentialResource
  def initialize
    @information = { potResource_id: nil }
    @information[:comments] = []
  end

  def create(position, salary, full_name = nil)
    @information[:potResource_id] = self
    @information[:full_name] = full_name
    @information[:position] = position
    @information[:salary] = salary
  end

  def edit_info(position, salary, full_name = nil)
    @information[:full_name] = full_name
    @information[:position] = position
    @information[:salary] = salary
  end

  def add_comment(comment)
    @information[:comments].push comment
  end

  def remove_comment(comment)
    @information[:comments].delete(comment)
  end

  def exists?
    return true unless @information.fetch(:potResource_id).equal?(nil)

    false
  end

  def information(symbol)
    @information.fetch(symbol.to_sym)
  end
end
