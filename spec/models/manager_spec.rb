require 'rails_helper'

RSpec.describe Manager, type: :model do
  context 'associations' do
    it { should belong_to(:establishment).class_name('Manager') }
  end
end
