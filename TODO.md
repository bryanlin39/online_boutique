# Online Boutique

## Core Functionality

### Models
- [x] User - username, email, admin
  - [x] Has one Account
- [x] Account - user_id
  - [x] Belongs to User
  - [x] Has many Reviews
  - [x] Has many Orders
- [x] Product - name, description, price, rating, image
  - [x] Has many Order Items
  - [x] Has many Reviews
- [x] Order - status, subtotal, tax, shipping, total_price
  - [x] Belongs to Account
  - [x] Has many Order Items
- [x] Order Item - quantity
  - [x] Belongs to Order
  - [x] Belongs to Product
- [x] Review - rating, content
  - [x] Belongs to Account
  - [x] Belongs to Product

### Views
- [x] CRUD for Product
  - [x] Admin authorization
- [x] CRUD for Shopping Cart
- [x] CRUD for Review
  - [x] Admin authorization for delete
  - [x] User authorization for delete and edit
- [ ] Account Profile
  - [ ] Order history
  - [ ] Reviews
- [x] Checkout
  - [x] Subtotal, shipping, tax, total
  - [x] Receipt page
- [ ] Product index page - list by date added
  - [ ] Scopes to sort by date added, price low to high, price high to low, most reviewed
- [ ] Home page
  - [ ] 3 recently added products
  - [ ] 3 most reviewed
- [ ] About page
- [ ] Contact page
- [ ] Sticky footer for all pages
  * https://philipwalton.github.io/solved-by-flexbox/demos/sticky-footer/
- [ ] Breadcrumbs

### Misc
- [x] Stripe for checkout
  * Check Stripe documentation for deploying to Heroku (API keys)
- [ ] Devise admin dashboard
- [ ] Deploy to Heroku
- [ ] README

### Styling
- [x] SemanticUI
  - [x] Icons
- [ ] SASS

### Scopes
- [ ] Product
  - [ ] Recently added
  - [ ] Most reviewed


## Further Exploration
- [ ] AJAX
- [ ] Testing
  - [ ] SimpleCov
  - [ ] FactoryBot
- [ ] Email confirmation
  - [ ] On sign up
  - [ ] After checkout
- [ ] APIs
  - [ ] Sales tax
  - [ ] Shipping costs
  - [ ] Mailer
- [ ] Add avatars to accounts
- [ ] Pagination for reviews, order history
