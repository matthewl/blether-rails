# Blether API

> verb (chiefly Scottish)
> talk in a long-winded way without making very much sense: there's plenty of stuff I could blether about from today.

Blether is an API endpoint written in Rails for a fictitious micro-blogging platform. Its sole purpose is to be used to explore the API only option for the Ruby on Rails framework.

Blether exposes the following RESTful endpoints:

* `POST /accounts` - Creates a new account (done ✅).
* `POST /auth/login` - Logs an account in (done ✅).
* `POST /auth/logout` - Logs the current account out.
* `GET /posts` - Gets the current account's timeline.
* `GET /:username/` - Gets the user's recent posts.
* `GET /posts/:id` - Gets a post (done ✅).
* `POST /posts` - Creates a new post (done ✅).
* `PUT /posts/:id` - Updates a post (done ✅).
* `DESTROY /posts/:id` - Deletes a post (done ✅).
* `POST /posts/reply` - Reply to a post.

More endpoints may follow.