require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'associations' do
    it { should belong_to(:establishment).class_name('Establishment') }
  end
end
