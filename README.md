# Blether API

> verb (chiefly Scottish)
> 
> talk in a long-winded way without making very much sense: _there's plenty of stuff I could blether about from today._

Blether is an API written in Rails for a fictitious micro-blogging platform. Its sole purpose is to be used to explore the API only option for the Ruby on Rails framework.

Blether exposes the following RESTful endpoints:

* `POST /accounts` - Creates a new account (done ✅).
* `POST /auth/login` - Logs an account in (done ✅).
* `POST /auth/logout` - Logs the current account out (Need to look into this - case of clearing client session? 👀).
* `GET /posts` - Gets the current account's timeline (done ✅).
* `GET /posts/:id` - Gets a post (done ✅).
* `POST /posts` - Creates a new post (done ✅).
* `PUT /posts/:id` - Updates a post (done ✅).
* `DESTROY /posts/:id` - Deletes a post (done ✅).
* `POST /posts/reply` - Reply to a post (done ✅).
* `POST /friends` - Follow account with username parameter (done ✅)
* `DESTROY /friends/:id` - Unfollow account (done ✅).
* `GET /user/posts/:username/` - Gets the accounts's recent posts (done ✅).

More endpoints may follow.

I'm also considering working on a few other features for this API.

* Better authorisation for endpoints.
* Versioning of the API.
* Pagination of posts.
* Favourites/bookmarking of posts.
* A search endpoint.