# User < ApplicationRecord
    email X
    password X
    role_type X
    first_name X
    last_name X

# Admin < User('admin')
    has_one  :company X

# ProjectManager < User('project_manager')
    has_many :projects X

# HumanResourceManager < User('hr_manager)
    has_many :potential_resources X
    has_many :resources, as: :manageable X

# CEO < User('ceo')
    belongs_to :company X
    
    salary X

# Company < ApplicationRecord
    belongs_to :admin X
    has_many :resources, as: :manageable X
    has_one  :ceo X

    name X
    debt X
    
# Project < ApplicationRecord
    belongs_to :project_manager X
    has_many :resources, as: :manageable X
    has_many :comments, as :commentable X

    name X
    resource_requirements X
    start X
    finish X

# PotentialResource < ApplicationRecord
    belongs_to :human_resource_manager  X
    has_many :comments, as :commentable X

    email 
    name
    last_name
    position

    

# Resource < ApplicationRecord
    belongs_to :manageable, as: polymorphic: true X
    has_many :comments, as :commentable X
    has_many :leave_notices X

    email X
    name X
    last_name X
    position X
    salary X
    birthday X

# Comment < ApplicationRecord
    belongs_to :commentable, polymorphic => true X

    author
    content
    creation_date

# LeaveNotice < ApplicationRecord
    belongs_to :resource X

    start
    finish
    reason





