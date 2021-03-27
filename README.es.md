# cookbook

`cookbook` is a non-gui app to manage your recipes in the terminal and them in a csv file. It also scrapes Allrecipes.com to allow you to search for recipes and add them directly to your cookbook.

It is written in ruby only and follows the MVC pattern

## Features
* list all recipes
* create a recipe
* delete a recipe
* import recipes from AllRecipes
* mark a recipe as `done`




## Installation
### Clone the repository
```
$ git clone git@github.com:jordannardoj/cookbook.git
$ cd project
```
### Check your Ruby version
```
$ ruby -v
```
The ouput should start with something like ruby 2.5.1

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):
```
$ rbenv install 2.5.1
```

## Usage
Start the app with ruby:
```
$ ruby lib/app.rb
```

Run unit tests with rspec:
```
$ rspec
```
