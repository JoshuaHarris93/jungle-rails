require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
 
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see a product details page accessed from the homepage" do
    visit root_path

    # @category.products.create!(
      #   name:  Faker::Hipster.sentence(3),
      #   image: open_asset('apparel1.jpg'),
      #   description: Faker::Hipster.paragraph(4),
    #   quantity: 10,
    #   price: 64.99
    # )
    
    
    # expect(page).to have_css 'article.product', count: 10


    find(:css, '.product:first-of-type header a').click
    expect(page).to have_css '.products-show'
    
    puts page.html
    
    save_screenshot
  end

end
