require "rails_helper"

RSpec.describe Product, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should belong_to(:category) }

  context "custom validation" do
    let!(:category) { Category.create(name: "ct") }
    let!(:product) { Product.create(title: "New", category: category, description: "<h1>Hello world</h1>") }
    it "strip Html form description" do
      # p = Product.create! title: "Book", description: "<h1>Hello world</h1>", price: 10, category: c
      expect(product.description).to eq "Hello world"
    end

    it "make title lowcase" do
      expect(product.title).to eq "new"
    end
  end
end
