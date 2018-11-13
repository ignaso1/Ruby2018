require 'user'
# Human resource manager class
class HumanResourceManager < User
  attr_reader :resources, :projects
  def initialize
    super('human_resource_manager')
    @resources = []
    @users = []
    @projects = []
  end

  def create_project(project_name, reqs)
    project = Project.new(project_name, reqs)
    projects << project
  end

  def create_resource(name, last_name)
    resource = Resource.new(name, last_name)
    resources << resource
  end

  def change_resource_position(id, position)
    resources.fetch(resource_index(id)).information[:position] = position
  end

  def change_resource_salary(id, name)
    resources.fetch(resource_index(id)).information[:name] = name
  end

  def change_resource_last_name(id, last_name)
    resources.fetch(resource_index(id)).information[:last_name] = last_name
  end

  def change_resource_birthday(id, birthday)
    resources.fetch(resource_index(id)).information[:birthday] = birthday
  end

  def change_resource_name(id, name)
    resources.fetch(resource_index(id)).information[:name] = name
  end

  def change_project_name(id, name)
    projects.fetch(project_index(id)).information[:name] = name
  end

  def change_project_reqs(id, reqs)
    projects.fetch(project_index(id)).information[:resource_reqs] = reqs
  end

  def project_index(id)
    projects
      .index(projects.select { |project| project.information[:id] = id }[0])
  end

  def resource_index(id)
    resources
      .index(resources.select { |resource| resource.information[:id] = id }[0])
  end

  def delete_project(id)
    projects.delete(project_index(id))
  end

  def delete_resource(id)
    resources.delete(resource_index(id))
  end
end