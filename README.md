# m2h

markdown to html compiler.

## feature

- page-break
  - '////' 4 or more slashes.
- header option
  - with title and page-number.
- cover option
  - set title to cover page.

## Installation

Install it yourself as:

    $ gem install m2h

Or dd this line to your application's Gemfile:

    gem 'm2h'

And then execute:

    $ bundle


## Usage

    Usage  : m2h <markdonw_file1> <markdonw_file2> ... <options>
    Options:
      -s, --serif   : font-family -> serif
      -d, --header  : with header
      -c, --cover   : with cover
      -h, --help    : show this messages
      -v, --version : show version infomation

