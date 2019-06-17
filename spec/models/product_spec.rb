require 'rails_helper'

RSpec.describe Product, type: :model do

  context "when checking product fields " do
    
    it 'is not valid' do
      @category = Category.new
      @product = Product.new
      @product.category = @category
      
      @product.name = "Josh"
      @product.price = 25
      @product.quantity = 3

      expect(@product).to be_valid
    end

    it 'name is not valid' do
      @category = Category.new
      @product = Product.new
      @product.category = @category

      @product.name = nil
      @product.price = 25
      @product.quantity = 3
      expect(@product).to_not be_valid
    end
    
    it 'price is not valid' do
      @category = Category.new
      @product = Product.new
      @product.category = @category
      
      @product.name = "Electric Chair"
      @product.price = nil
      @product.quantity = 3
      expect(@product).to_not be_valid
    end

    it 'quantity is not valid' do
      @category = Category.new
      @product = Product.new
      @product.category = @category

      @product.name = "Red Bookshelf"
      @product.price = 2483.75
      @product.quantity = nil
      expect(@product).to_not be_valid
    end

    it 'categories are not valid' do
      @category = Category.new
      @product = Product.new

      @product.name = "Hotdog Slicer"
      @product.price = 26
      @product.category = nil
      expect(@product).to_not be_valid
    end 
  end
end


