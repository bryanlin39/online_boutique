# Online Boutique

#### _E-commerce web application created with Ruby on Rails_
#### _January 16, 2018_

### By Bryan Lin

## Description

_Online Boutique is an e-commerce platform for small-business owners to exhibit their products, receive customer feedback, and generate revenue. Users can view products, write product reviews, add items to their shopping cart, and checkout with a credit card. Admin users can add/edit/delete products, as well as delete reviews. The application is built with Ruby on Rails, with data being managed using PostgreSQL._

## Installation and Setup

View the application directly at https://blooming-lake-67400.herokuapp.com/.

To install on your own machine, please follow the instructions below:

* You will need the following properly installed on your computer:
  * Ruby
  * Rails
  * PostgreSQL
* Clone the repository: ``` $ git clone https://github.com/bryanlin39/online_boutique ```
* Navigate to the project directory: ``` $ cd online_boutique ```
* Create a ```.env``` file in the root directory:
  ```
  PUBLISHABLE_KEY='[Your Stripe Publishable Key]'
  SECRET_KEY='[Your Stripe Secret Key]'
  ```
  * Replace the brackets with your own [Stripe](https://stripe.com/docs) API key.
* Install Gems and dependencies: ``` $ bundle install ```
* Set up the database:
  ```
  $ rails db:create
  $ rails db:migrate
  $ rails db:seed
  ```
* Launch the application: ``` $ rails s ```
* Navigate to the application home page: ```localhost:3000``` in your browser

### User Setup

* Sign up as a normal user to add items to your cart, checkout, and write product reviews
* Alternatively, sign in as the seeded customer to edit pre-populated reviews:
  * Email: user@email.com
  * Password: asdfasdf
* To give admin privileges (to the most recently created user):
  ```
  $ rails c
  $ User.last.update(admin: true)
  ```

### Stripe Payment

To make a mock payment, use the following credit card information:

* Card number: 4242 4242 4242 4242
* Expiration date: 10/20
* CVC: 123

## Known Bugs

None

## Support and Contact Information

For any comments or concerns, please email Bryan at bryanlin39@gmail.com.

## Technologies Used

* Ruby
* Rails
* PostgreSQL
* JavaScript
* jQuery
* AJAX
* HTML/CSS
* SASS
* Semantic UI
* Stripe API
* Devise

### License

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Copyright (c) 2018 **Bryan Lin**
