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
    Product.destroy_all
    Review.destroy_all
  end

  def create_users
    @admin = User.create(
      email: 'admin@email.com',
      username: 'admin',
      password: 'asdfasdf',
      password_confirmation: 'asdfasdf',
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
      description: 'A classy display for your spirits collection.',
      price: 125.00,
      image: open('public/images/bar_cart.jpg')
    )
    Product.create(
      name: 'Duffel Bag',
      description: 'Weekender traveler bag in brown leather.',
      price: 140.00,
      image: open('public/images/duffel.jpg')
    )
    Product.create(
      name: 'Teepee Bed',
      description: 'Mini tent for pets to camp in the house.',
      price: 70.00,
      image: open('public/images/teepee.jpg')
    )
    Product.create(
      name: 'Coat Hanger',
      description: 'A modern wall unit to hang coats and jackets.',
      price: 48.00,
      image: open('public/images/coat_hanger.jpg')
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
