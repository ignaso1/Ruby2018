class ProjectManager < User
    attr_reader :projects
  def initialize
    @projects = []
  end

  def change_project_name(project, new_name)
    projects.fetch(projects.index(project)).information[:name] = new_name
  end

  def change_project_reqs(project, new_reqs)
    return unless new_reqs.positive?

    projects.fetch(projects.index(project))
            .information[:resource_reqs] = new_reqs
  end

  def define_project_start(project, date)
    projects.fetch(projects.index(project)).define_start(date)
  end

  def define_project_finish(project, date)
    projects.fetch(projects.index(project)).define_finish(date)
  end

  def comment_project(comment_recipient)
    projects.fetch(projects.index(comment_recipient.project))
            .comments << comment_recipient.comment
  end

  def remove_comment_project(comment_recipient)
    projects.fetch(projects.index(comment_recipient.project))
            .comments.delete(comment_recipient.comment)
  end

  def comment_res(comment_recipient)
    projects.fetch(projects.index(comment_recipient.project))
            .resources.fetch(resource_index(comment_recipient))
            .comments << comment_recipient.comment
  end

  def remove_comment_res(comment_recipient)
    projects.fetch(projects.index(comment_recipient.project))
            .resources.fetch(resource_index(comment_recipient))
            .comments.delete(comment_recipient.comment)
  end

  def resource_index(comment_recipient)
    projects.fetch(projects.index(comment_recipient.project))
            .resources.index(comment_recipient.resource)
  end
end
