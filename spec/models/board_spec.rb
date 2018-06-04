require 'rails_helper'
RSpec.describe Board, type: :model do
  
  describe 'attributes' do 
    it {should respond_to :name,:body}
  end
end
