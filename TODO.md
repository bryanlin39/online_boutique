# Online Boutique

## Core Functionality

### Models
- [x] User - username, email, admin
  - [x] Has one Account
- [x] Account - user_id
  - [x] Belongs to User
  - [x] Has many Reviews
  - [ ] Has many Orders
- [x] Product - name, description, price, rating, image
  - [ ] Has many Order Items
  - [x] Has many Reviews
- [ ] Order - status, subtotal, tax, shipping, total_price
  - [ ] Belongs to Account
  - [ ] Has many Order Items
- [ ] Order Item - quantity
  - [ ] Belongs to Order
  - [ ] Belongs to Product
- [x] Review - rating, content
  - [x] Belongs to Account
  - [x] Belongs to Product

### Views
- [x] CRUD for Product
  - [x] Admin authorization
- [ ] CRUD for Shopping Cart
- [x] CRUD for Review
  - [x] Admin authorization for delete
  - [x] User authorization for delete and edit
- [ ] Account Profile
  - [ ] Order history
  - [ ] Reviews
- [ ] Sticky footer for all pages
  * https://philipwalton.github.io/solved-by-flexbox/demos/sticky-footer/

### Misc
- [ ] Stripe for checkout
- [ ] Devise admin dashboard

### Styling
- [x] SemanticUI
  - [ ] Icons
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
  - [ ] On checkout
- [ ] APIs
  - [ ] Sales tax
- [ ] Add avatars to accounts
