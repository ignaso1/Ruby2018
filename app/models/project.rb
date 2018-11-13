class Project < ApplicationRecord
    attr_reader :resources, :comments, :information
    def initialize(project_name, resource_reqs)
        @information = { start: nil,
                        finish: nil }
        @information[:id] = self
        @information[:name] = project_name
        @information[:resource_reqs] = resource_reqs if resource_reqs.positive?
        @resources = []
        @comments = []
    end

    def define_start(date)
        information[:start] = date if date > Date.today
    end

    def define_finish(length)
        information[:finish] = info('start') + length if length.positive?
    end

    def add_resource(resource)
        resources << resource if resource.instance_of?(Resource)
    end

    def remove_resource(resource)
        resources.delete(resource)
    end

    def add_comment(comment)
        comments << comment if comment.instance_of?(Comment)
    end

    def remove_comment(comment)
        comments.delete(comment)
    end

    def info(symbol)
        information.fetch(symbol.to_sym)
    end
end
