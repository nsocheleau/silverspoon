require 'rails_helper'

RSpec.describe User, type: :model do
  it 'must have a valid fabricator' do
    Fabricate(:user)
  end
end
