# Design Notes

- Download latest version from [versions.json](https://saucelabs.com/versions.json)
  - If a specific version number is provided by the user then use that instead.
- Unzip sauce connect executable via [RubyZip](https://github.com/rubyzip/rubyzip)
- Starts Sauce Connect with the provided command line arguments
  - By default `SAUCE_USERNAME` and `SAUCE_ACCESS_KEY` will be used
- Waits for Sauce Connect to successfully initialize a tunnel
  - Waits for tests ready message on stdout
- Terminates SC on close

