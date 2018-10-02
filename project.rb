# Projects are used to represent temporary collaborative endeavours
# to achvieve a particular goal
class Project
  attr_accessor :resources, :comments, :information
  def initialize(project_name, resource_reqs)
    @information = { project_start: nil,
                     project_finish: nil }
    @information[:project_id] = self
    @information[:project_name] = project_name
    @information[:resource_reqs] = resource_reqs > 0 ? resource_reqs : 1
    @resources = []
    @comments = []
  end

  def define_start(year, month, day)
    project_start = Date.new(year, month, day)
    return unless project_start > Date.today

    @information[:project_start] = project_start
  end

  def define_finish(length)
    return unless length > 0

    @information[:project_finish] = @information[:project_start] + length
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
