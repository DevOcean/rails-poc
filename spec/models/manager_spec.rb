require 'rails_helper'

RSpec.describe Manager, type: :model do
  context 'associations' do
    it { should have_one(:establishment).class_name('Establishment') }
  end
end
