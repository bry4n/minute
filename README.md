Minute
======

Flexible Natural Language Date/Time parsing library for Ruby (1.9.x)

## Feature

* Flexible Natural Language parsing
* Source code is small, readable and maintainable
* Can parse short or long sentence when date/time is included

## Approach

[Chronic](https://github.com/mojombo/chronic) has been an amazing gem, but I learned its limitation. It cannot parse long sentence or it will give you `nil` as a resultant value. Chronic's code design is difficult to maintain. 

I was thinking what if I can create a simple Ruby library with the same approach, but more flexible and more features. Thus, Minute was created to address this problem.

Examples:

```ruby

Chronic.parse("I have to meet my friend on December 13 in Dallas, TX")
#=> nil

Minute.parse("I have to meet my friend on December 13 in Dallas, TX")
#=> 2012-12-13 00:00:00 -0600

```


## Installation

**Gemfile**

	gem 'minute'
	
**RubyGem**

	gem install minute
	
## Usage


```ruby

require 'minute'

Minute.parse("Hi! I am Ruby. I was born on Feb 24 1993. My father taught me to make programmers happy.")
#=> 1993-02-24 00:00:00 -0600

Minute.parse("Birthday party is tomorrow night!", now: Time.now)
#=> => 2012-05-01 11:20:48 -0500

```


## Speed

Minute is using `String#index?` or Regular Expression to recognize the date or time. `String#index?` is using [Rabin-Karp String Search algorithm](http://en.wikipedia.org/wiki/Rabin%E2%80%93Karp_string_search_algorithm), which it is making the search faster.

	                           user     system      total        real
	minute                12.750000   0.080000  12.830000 ( 12.833267)
	chronic               97.860000   0.130000  97.990000 ( 97.983466)


## TODO

Minute is still young. Some features are being added soon. 

Planned to add the following:

* This december
* Last Janurary
* between 8am and 5pm
* between Jan and July
* every weekend
* this morning
* tonight
* and more..

## Contribution

If you discover bugs or want to help or improve it, Pull Requests are welcome. 

Ensure that your Pull request is using a topic branch for patching, improving, refactoring, etc.

## License

Minute is licensed under the MIT License.
