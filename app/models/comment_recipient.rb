class CommentRecipient < ApplicationRecord
    attr_reader :comment, :project, :resource
    def initialize(comment, project, resource)
      @comment = comment if comment.instance_of?(Comment)
      @project =  project if project.instance_of?(Project)
      @resource = resource if resource.instance_of?(Resource)
    end
end
