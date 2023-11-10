require "rails_helper"

RSpec.describe "merchant discount show page" do
  before :each do
    @merchant_1 = create(:merchant)
    @discount_1 = create(:discount, merchant: @merchant_1, percentage_discount: 0.2, quantity_threshold: 10)
    @discount_2 = create(:discount, merchant: @merchant_1, percentage_discount: 0.3, quantity_threshold: 15)
  end

  it "shows all information for a discount and not other discounts" do
    visit merchant_discount_path(@merchant_1, @discount_1)
    
    expect(page).to have_content(@merchant_1.name)
    expect(page).to have_content(@discount_1.id)
    expect(page).to have_content(@discount_1.percentage_discount)
    expect(page).to have_content(@discount_1.quantity_threshold)

    expect(page).to_not have_content(@discount_2.id)
    expect(page).to_not have_content(@discount_2.percentage_discount)
    expect(page).to_not have_content(@discount_2.quantity_threshold)
  end
end