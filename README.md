# UI testing

## Setup

> **Important:** These instructions assume that you have Ruby 2.1 installed, preferably managed with either [RVM](https://rvm.io/) or [rbenv](https://github.com/rbenv/rbenv), and [Homebrew](http://brew.sh).

1. Install [RubyMine](https://www.jetbrains.com/ruby/) – optional.
2. Install [Appium](http://appium.io/), either the Mac app or through Node (`npm install -g appium`).
3. Install the Appium client: `brew install node; npm install -g wd`
4. Clone this repository.
5. Open project in Ruby Mine – or in your favourite text editor.
6. Install bundler: `gem install bundler`
7. Navigate to the repository folder and run `bundle install`.


## Project Structure
```
ui-testing
|   config
|    |   android
|    |   |  appium settings
|    |   ios
|    |   |  appium settings
|    |   |
|   features
|    |   pages
|    |   |  android
|    |   |   |  page object
|    |   |  ios
|    |   |   |  page object
|    |   |  base page objects
|    |   step_definitions
|    |   support
|    |   feature files
|    Gemfile and Rakefile
```


## Configuration

You should configure the `appium.txt` under the `config/<platform>/` folder.


## Environment variables

You should define `PLATFORM_NAME` with the value `'ios'` or `'android'` (depends on what you want to run):

* In RubyMine's running configuration.

* In the command line:
```bash
export PLATFORM_NAME=android
```


## Running

### Command Line

1. Start the Appium server on a terminal: `appium --port 5555`.
2. Run the test suite: `cucumber`.
3. You can combine tags and feature files and so on. [More information](https://github.com/cucumber/cucumber/wiki).

### Rake

1. Start the Appium server on a terminal: `appium`.
2. Run acceptance tests on the selected platform (ios|android) with selected tag:
- platfrom parameter is mandatory 
- tag parameter is optional


```bash
rake run_acceptance[android,@tag_parameter]
```

or

You don't have to start the Appium server manually just use the single_run_acceptance rake command


```bash
rake single_run_acceptance[android,@tag_parameter]
```

or

Also a simple way to rerun failed cucumber scenarios automtically once - use the single_run_acceptance_with_retry rake command

```bash
rake single_run_acceptance_with_retry[android,@tag_parameter]
```


## Reporting

* In the command line:
```bash
cucumber --format html --out reports.html
```

or

```bash
cucumber --format html > features.html
```

* You can also export your tests result to an HTML file inside the RubyMine.


## Locators (ids, names, etc..)

* You can use the [Appium Inspector](https://www.youtube.com/watch?v=Hv9A9WfYF4g).
