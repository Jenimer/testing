require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'task has a name and description(body)'
    it { should respond_to :name, :body}
end
