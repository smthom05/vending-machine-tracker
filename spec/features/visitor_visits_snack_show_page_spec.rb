require 'rails_helper'

feature 'When a user visits a snack show page' do
  scenario 'they see the name of the snack, the price, list of locations, average price of snacks in that machine, and the count of the items in that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack = dons.snacks.create(name: 'chips', price: 1)
    snack_2 = dons.snacks.create(name: 'candy', price: 2)

    visit snack_path(snack)

    expect(page).to have_content(snack.name)
    expect(page).to have_content(snack.price)
    expect(page).to have_content(snack.machines)
    expect(page).to have_content(snack.machines.average_price)
    expect(page).to have_content(snack.machine.count)
  end
end
