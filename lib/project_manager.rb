require './lib/user.rb'
require './lib/project.rb'
# Project manager class
class ProjectManager < User
  attr_reader :projects
  def initialize
    @projects = []
  end

  def change_project_name(project, new_name)
    return unless project.instance_of?(Project) && @projects.include?(project)

    @projects[project_index(project)].information[:name] = new_name
  end

  def change_project_reqs(project, new_reqs)
    return unless project.instance_of?(Project) && new_reqs > 0

    @projects[project_index(project)]
      .information[:resource_reqs] = new_reqs
  end

  def define_project_start(project, date)
    return unless project.instance_of?(Project) &&
                  date.instance_of?(Date) && date > Date.today

    @projects[project_index(project)].define_start(date)
  end

  def define_project_finish(project, length)
    return unless project.instance_of?(Project) && length > 0

    @projects[project_index(project)].define_finish(length)
  end

  def comment_project(project, comment)
    return unless comment.instance_of?(Comment)

    @projects[project_index(project)]
      .comments << comment
  end

  def remove_comment_project(project, comment)
    return unless comment.instance_of?(Comment)

    @projects[project_index(project)]
      .comments.delete(comment)
  end

  def comment_res(project, resource, comment)
    return unless comment.instance_of?(Comment) &&
                  @projects.include?(project) &&
                  project.resources.include?(resource)

    @projects[project_index(project)]
      .resources[resource_index(project, resource)]
      .comments << comment
  end

  def remove_comment_res(project, resource, comment)
    return unless comment.instance_of?(Comment) &&
                  resource.comments.include?(comment)

    @projects[project_index(project)]
      .resources[resource_index(project, resource)]
      .comments.delete(comment)
  end

  def resource_index(project, resource)
    return unless project.resources.include?(resource) &&
                  @projects.include?(project)

    @projects[project_index(project)]
      .resources.index(resource)
  end

  def project_index(project)
    return @projects.index(project) if @projects.include?(project)
  end
end
