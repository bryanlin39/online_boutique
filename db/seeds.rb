class Seed

  def self.begin
    seed = Seed.new
    seed.clear_database
    seed.create_users
    seed.create_products
    seed.create_reviews
  end

  def clear_database
    User.destroy_all
    Account.destroy_all
    Product.destroy_all
    Review.destroy_all
    Order.destroy_all
    OrderItem.destroy_all
  end

  def create_users
    @admin = User.create(
      email: 'admin@email.com',
      username: 'admin',
      password: 'fdsafdsa1',
      password_confirmation: 'fdsafdsa1',
      admin: true
    )
    @user = User.create(
      email: 'user@email.com',
      username: 'user',
      password: 'asdfasdf',
      password_confirmation: 'asdfasdf'
    )

    password = Faker::Internet.password

    20.times do
      User.create(
        email: Faker::Internet.safe_email,
        username: Faker::Internet.user_name,
        password: password,
        password_confirmation: password
      )
    end
  end

  def create_products
    Product.create(
      name: 'Bar Cart',
      description: 'Classy display for your spirits collection. The following sentences are populated with Lorem Ipsum. ' + Faker::Lorem.paragraph,
      price: 165.00,
      image: open('public/images/bar_cart.jpg')
    )
    Product.create(
      name: 'Duffel Bag',
      description: 'Weekender traveler bag in brown leather. The following sentences are populated with Lorem Ipsum. ' + Faker::Lorem.paragraph,
      price: 140.00,
      image: open('public/images/duffel.jpg')
    )
    Product.create(
      name: 'Teepee Bed',
      description: 'Mini tent for pets to camp in the house. The following sentences are populated with Lorem Ipsum. ' + Faker::Lorem.paragraph,
      price: 90.00,
      image: open('public/images/teepee.jpg')
    )
    Product.create(
      name: 'Coat Hanger',
      description: 'Modern wall unit to hang coats and jackets. The following sentences are populated with Lorem Ipsum. ' + Faker::Lorem.paragraph,
      price: 42.00,
      image: open('public/images/coat_hanger.jpg')
    )
    Product.create(
      name: 'Terrarium',
      description: 'Miniature plant ecosystem enclosed in a cubic glass container. The following sentences are populated with Lorem Ipsum. ' + Faker::Lorem.paragraph,
      price: 56.00,
      image: open('public/images/terrarium.jpg')
    )
    Product.create(
      name: 'Bracelet',
      description: 'Intricate bracelet with teal and white tones and a gold clasp. The following sentences are populated with Lorem Ipsum. ' + Faker::Lorem.paragraph,
      price: 23.00,
      image: open('public/images/bracelet.jpg')
    )
    Product.create(
      name: 'Sunglasses',
      description: 'Rose gold sunglasses with a pink trim. The following sentences are populated with Lorem Ipsum. ' + Faker::Lorem.paragraph,
      price: 75.00,
      image: open('public/images/sunglasses.jpg')
    )
    Product.create(
      name: 'Coffee Table',
      description: 'Table with a wood top and black metal frames for the living room. The following sentences are populated with Lorem Ipsum. ' + Faker::Lorem.paragraph,
      price: 215.00,
      image: open('public/images/coffee_table.jpg')
    )
  end

  def create_reviews
    Product.all.each do |product|
      Review.create(
        account_id: @user.id,
        product_id: product.id,
        content: 'Great product! It was exactly as described, and well worth the price.',
        rating: rand(4..5)
      )
      rand(5..30).times do
        Review.create(
          account_id: rand(User.first.id..User.last.id),
          product_id: product.id,
          content: Faker::Lorem.paragraph,
          rating: rand(1..5)
        )
      end
    end

    Review.all.each do |review|
      review.created_at = Faker::Time.between(DateTime.now - 1.year, DateTime.now)
      review.save
    end
  end

end

Seed.begin
