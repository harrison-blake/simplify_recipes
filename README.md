# README

[Simplify Recipes](https://simplify-recipes-2c38fd213859.herokuapp.com/)

A website that takes in a recipe page url, removes all clutter and returns the ingredients, and cooking structions. 

link to backend repo: [simplify api](https://github.com/harrison-blake/simplify_api)

### ⚡Tech Stack

[![Skills](https://skillicons.dev/icons?i=python,flask,rails,ruby,postgres,docker,heroku)](https://skillicons.dev)</br>

- Rails 8.0.1
- deployed to Heroku
- test coverage with rspec
- follows omakase-rubocop coding practices
- CI/CD w/ heroku and github
- postgresql as database
- uses docker for development and deployment
- user login functionality

### TODO
- [x] fix styling on prod
- [ ] error checking
	- [ ] is gpt hallucinating because we can't crawl the website?
	- [x] what does service return if api is down?
- [ ] refactor recipes controller
	- [ ] pull parse_response function into service
- [ ] make sure recipe model is conforming to ruby conventions
- [ ] add user / login
	- [ ] if user is logged in then you can save recipes
	- [ ] cookies?
	- [ ] nav bar
		- [x] create nav bar elements and style
  		- [ ] login page
          	- [ ] sign up page
          	- [ ] about page
- [ ] change .env files to rails credentials
- [ ] build ci/cd pipeline
- [ ] add an image to the recipe page
