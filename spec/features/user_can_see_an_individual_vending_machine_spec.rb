require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they see the name of all of the snacks associated with that vending machine along with their price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack = dons.snacks.create(name: 'chips', price: 1)
    snack_2 = dons.snacks.create(name: 'candy', price: 2)
    visit machine_path(dons)

    expect(page).to have_content("Name: #{snack.name}")
    expect(page).to have_content("Price: $#{snack.price}")
    expect(page).to have_content("Name: #{snack_2.name}")
    expect(page).to have_content("Price: $#{snack_2.price}")
  end

  scenario 'I see an average price of all items' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack = dons.snacks.create(name: 'chips', price: 1)
    snack_2 = dons.snacks.create(name: 'candy', price: 2)
    visit machine_path(dons)

    expect(page).to have_content("Average Price: $1.5")
  end
end
