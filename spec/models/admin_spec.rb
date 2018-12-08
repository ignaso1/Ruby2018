# frozen_string_literal: true

require 'rails_helper'

describe Admin, type: :model do
  it { is_expected.to have_one(:company) }
end
