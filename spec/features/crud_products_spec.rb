require "rails_helper"

describe "user can crud prodct", type: :feature do
  let!(:product) { Product.create(title: "New", description: "<h1>Hello world</h1>") }
  it "can create a product" do
    visit "/"
    expect(page).to have_link "Create a product"
    click_on "Create a product"
    expect(page).to have_content "Create product"
    fill_in "Title", with: "jQuery book"
    fill_in "Description", with: "jQuery book dessss"
    click_on "Submit"
    expect(page).to have_content "jQuery book"
  end
  it "can edit a product" do
    visit "/products/#{Product.last.id}"
    expect(page).to have_link "Edit"
    click_on "Edit"
    fill_in "Title", with: "jQuery book edited"
    click_on "Ok"
    expect(page).to have_content "jquery book edited"
  end
  # it "can delete a product" do
  #   visit "/edit/#{Product.first.id}"
  #   expect(page).to have_link "Edit"
  #   click_on "Edit"
  #   fill_in "Title", with: "jQuery book Edited"
  #   click_on "Ok"
  #   expect(page).to have_content "jQuery book Edited"
  # end
end
