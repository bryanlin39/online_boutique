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
- [x] Shopping Cart
- [x] CRUD for Review
  - [x] Admin authorization for delete
  - [x] User authorization for delete and edit
- [x] Account Profile
  - [x] Order history
  - [x] Reviews
- [x] Checkout
  - [x] Subtotal, shipping, tax, total
  - [x] Receipt page
- [x] Product index page
  - [x] Scopes to sort by customer rating, date added, price
- [x] Home page
  - [x] 3 recently added products
  - [x] 3 most reviewed
- [x] Contact page
- [x] Sticky footer for all pages
- [x] Breadcrumbs

### Misc
- [x] Stripe for checkout
  * Check Stripe documentation for deploying to Heroku (API keys)
- [ ] Devise admin dashboard
- [ ] Deploy to Heroku*
- [x] README
- [x] Seed more products


## Further Exploration
- [x] AJAX
- [ ] Testing*
  - [ ] SimpleCov
  - [ ] FactoryBot
- [ ] Send email confirmation
  - [ ] On sign up
  - [ ] After checkout
  - [ ] Contact message received
- [ ] APIs
  - [ ] Sales tax
  - [ ] Shipping costs
  - [ ] Mailer
- [ ] Add avatars to accounts
- [x] Pagination for reviews, order history
