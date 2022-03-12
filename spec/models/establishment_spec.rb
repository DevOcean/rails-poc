require 'rails_helper'

RSpec.describe Establishment, type: :model do
  context 'associations' do
    it { should have_one(:address).class_name('Address') }
    it { should have_many(:users).class_name('User') }
    it { should have_many(:events).class_name('Event') }
  end
end
