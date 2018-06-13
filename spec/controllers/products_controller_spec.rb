require "rails_helper"
RSpec.describe ProductsController, type: :controller do
  describe "#index" do
    it "gets a list of products" do
      products = []
      products << Product.create(title: "123", description: "123")
      products << Product.create(title: "123", description: "123")
      get :index
      expect(assigns(:products)).to eq products
      expect(response).to render_template("index")
    end
  end

  describe "#show" do
    it "show a product" do
      products = []
      products << Product.create(title: "1234", description: "123")
      products << Product.create(title: "123", description: "123")
      get :show, params: {id: Product.first.id}
      expect(assigns(:product)).to eq Product.first
      expect(response).to render_template("show")
    end
  end

  describe "#new" do
    it "new a product" do
      get :new
      expect(assigns(:product)).to be_a Product
    end
  end

  describe "#create" do
    it "create new product" do
      post :create, params: {product: {title: "zxc", description: "Description 1"}}
      expect(assigns(:product).title).to eq "zxc"
    end
  end
  # describe "#edit" do
  #   it "edit success" do
  #     get :edit, params: {id: Product.first.id}
  #     expect(respone).to render_template :edit
  #     expect(assigns(:product)).to eq Product.first
  #   end
  # end
end
