require 'rails_helper'

describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'instance methods' do
    it 'should add up the prices of all items and return the average' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack = dons.snacks.create(name: 'chips', price: 1)
      snack_2 = dons.snacks.create(name: 'candy', price: 2)

      expect(dons.average_price).to eq(1.5)
    end

    it 'should add up the prices of all items and return the average' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack = dons.snacks.create(name: 'chips', price: 1)
      snack_2 = dons.snacks.create(name: 'candy', price: 3)
      snack_3 = dons.snacks.create(name: 'cookie', price: 5)

      expect(dons.item_count).to eq(3)
    end
  end
end
