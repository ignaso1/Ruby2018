# User < ApplicationRecord
    email
    password
    role_type
    first_name
    last_name

# Admin < User('admin')
    has_many :users
    has_one  :company

# ProjectManager < User('project_manager')
    has_many :projects

# HumanResourceManager < User('hr_manager)
    has_many :potential_resources
    has_many :resources

# CEO < User('ceo')
    belongs_to :company
    
    salary

# Company < ApplicationRecord
    belongs_to :admin

    id
    name
    debt
    
    has_many :resources
    has_one  :ceo

# Project < ApplicationRecord
    belongs_to :project_manager

    name
    resource_requirements
    start
    finish

    has_many :resources
    has_many :comments, as :commentable

# PotentialResource < ApplicationRecord
    belongs_to :human_resource_manager

    email
    name
    last_name
    position

    has_many :comments, as :commentable

# Resource < ApplicationRecord
    belongs_to :project
    belongs_to :admin
    belongs_to :company

    email
    name
    last_name
    position
    salary
    birthday

    has_many :comments, as :commentable
    has_many :leave_notices

# Comment < ApplicationRecord
    belongs_to :commentable, polymorphic => true

    author
    content
    creation_date

# LeaveNotice < ApplicationRecord
    belongs_to :resource

    start
    finish
    reason





