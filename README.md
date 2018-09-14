# Blether API

Blether is an API endpoint written in Rails for a fictitious micro-blogging platform. Its sole purpose is to be used to explore the API only option for the Ruby on Rails framework.

Blether exposes the following RESTful endpoints:

* `POST /accounts` - Creates a new account.
* `POST /auth/login` - Logs an account in.
* `POST /auth/logout` - Logs the current account out.
* `POST /posts` - Creates a new post.
* `GET /posts/:id` - Gets a post.
* `PUT /posts/:id` - Updates a post.
* `DESTROY /posts/:id` - Deletes a post.
* `POST /posts/reply` - Reply to a post.

More endpoints may follow.