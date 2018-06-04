require 'rails_helper'

RSpec.describe List, type: :model do
  describe 'has a name and position' do
    it { should respond_to :name, :position}
  end
end
