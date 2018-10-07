# Projects are used to represent temporary collaborative endeavours
# to achvieve a particular goal
class Project
  attr_reader :resources, :comments, :information
  def initialize(project_name, resource_reqs)
    @information = { start: nil,
                     finish: nil }
    @information[:id] = self
    @information[:name] = project_name
    @information[:resource_reqs] = resource_reqs > 0 ? resource_reqs : 1
    @resources = []
    @comments = []
  end

  def define_start(date)
    @information[:start] = date if date > Date.today
  end

  def define_finish(length)
    @information[:finish] = info('start') + length if length > 0
  end

  def add_resource(resource)
    return resources << resource if resource.instance_of?(Resource)
  end

  def remove_resource(resource)
    return resources.delete(resource) if resources.include?(resource)
  end

  def add_comment(comment)
    return comments << comment if comment.instance_of?(Comment)
  end

  def remove_comment(comment)
    return comments.delete(comment) if comment.instance_of?(Comment)
  end

  def info(symbol)
    @information.fetch(symbol.to_sym)
  end
end
