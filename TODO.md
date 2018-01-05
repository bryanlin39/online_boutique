# Online Boutique

## Core Functionality

### Models
- [x] User - username, email, admin
  - [x] Has one Account
- [x] Account - user_id
  - [x] Belongs to User
  - [ ] Has many Reviews
  - [ ] Has many Orders
- [x] Product - name, description, price, rating, image
  - [ ] Has many Order Items
  - [ ] Has many Reviews
- [ ] Order - status, subtotal, tax, shipping, total_price
  - [ ] Belongs to Account
  - [ ] Has many Order Items
- [ ] Order Item - quantity
  - [ ] Belongs to Order
  - [ ] Belongs to Product
- [ ] Review - rating, content
  - [ ] Belongs to Account
  - [ ] Belongs to Product


### Views
- [ ] CRUD for Product
  - Admin authorization
- [ ] CRUD for Shopping Cart
- [ ] Account Profile


### Misc
- [ ] Stripe for checkout
- [ ] Devise admin dashboard


### Styling
- [x] SemanticUI
- [ ] SASS


## Further Exploration
- [ ] AJAX
- [ ] Testing
  - [ ] SimpleCov
  - [ ] FactoryBot
- [ ] Email confirmation
  - [ ] On sign up
  - [ ] On checkout
