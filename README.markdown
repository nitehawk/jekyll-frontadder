## Welcome to Jekyll Front Adder

Jekyll Front Adder is a module to add up the values of specified hashes from a post's front matter and add a running total back to the post's front matter.

[![Build Status](https://travis-ci.org/nitehawk/jekyll-frontadder.svg)](https://travis-ci.org/nitehawk/jekyll-frontadder)
[![GitHub version](https://badge.fury.io/gh/nitehawk%2Fjekyll-frontadder.svg)](https://badge.fury.io/gh/nitehawk%2Fjekyll-frontadder)

## Installation

Add this line to your site's Gemfile:

```ruby
gem 'jekyll-frontadder'
```

And then add this line to your site's `_config.yml`:

```yml
gems:
  - jekyll-frontadder
```

## Usage

Add an entry similar to the following to your `_config.yml`:
```yml
frontadder:
  - hours
```

This will configure frontadder to look for a hash structure called 'hours' on your site's posts, similar to the following:

```yml
hours:
  total: .5
  part:
    horizontal stabilizer: .5
  type:
    deburring: .5
```

When it finds this structure, it will add up all of the keys it finds.   As each post is processed, a copy of the running totals will be left under ['hash']['runtotal'] for use on the page.   After the plugin finishes, the site will have a hash entry with the totals for the entire site.

