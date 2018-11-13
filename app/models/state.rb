require 'yaml'
# Load/Restore state
class State < ApplicationRecord
  attr_reader :information
  def initialize
    @information = { users: [],
                     projects: [],
                     admin: nil,
                     ceo: nil,
                     company: nil }
  end

  def update_projects(projects)
    @information[:projects] = projects
  end

  def update_ceo(ceo)
    @information[:ceo] = ceo
  end

  def update_company(company)
    @information[:company] = company
  end

  def update_admin(admin)
    @information[:admin] = admin
  end

  def update_users(users)
    @information[:users] = users
  end

  def load_details(path)
    return false unless File.exist?(path)

    @information = YAML.load_file(path)
  end

  def save(path)
    File.open(path, 'w+') do |file|
      file.write(information.to_yaml)
    end
  end

  def empty?
    information.fetch(:users).eql?([]) &&
      information.fetch(:projects).eql?([])
  end

  def clear
    information[:users] = []
    information[:projects] = []
    information[:admin] = nil
    information[:ceo] = nil
    information[:company] = nil
  end
end