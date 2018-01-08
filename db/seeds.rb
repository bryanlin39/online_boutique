class Seed

  def self.begin
    seed = Seed.new
    seed.clear_database
    seed.create_users
    seed.create_products
  end

  def clear_database
    User.destroy_all
    Product.destroy_all
  end

  def create_users
    admin = User.create(
      email: 'admin@email.com',
      username: 'admin',
      password: 'asdfasdf',
      password_confirmation: 'asdfasdf',
      admin: true
    )
    user = User.create(
      email: 'user@email.com',
      username: 'user',
      password: 'asdfasdf',
      password_confirmation: 'asdfasdf'
    )
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
      name: 'Bracelets',
      description: 'A set of 2 white/black bracelets.',
      price: 18.00,
      image: open('public/images/bracelets.png')
    )
  end

end

Seed.begin
