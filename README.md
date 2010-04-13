# Rack::VersionHeader

Rack middleware for adding a (git|svn|you-name-it) version response header.

## Install

    gem install rack-version-header


## Usage

    require "rack/version_header"

    use Rack::VersionHeader,
      :header_name  => 'X-MyService-Version',   # default 'X-Version'
      :version_file => '.version'               # default '.version'

    run app

## Example usage with Git

Provided you have the `git` executable in your path you can add to your `config.ru`

    require "rack/version_header"

    gitsha = `git rev-parse --short HEAD`
    file   = File.dirname(__FILE__) + '/.gitsha'
    File.open(file, 'w') { |f| f.write(gitsha) }

    use Rack::VersionHeader,
      :header_name  => 'X-MyService-Git-Revision',
      :version_file => f.path

    run app

Then your response headers will look somewhat like

    HTTP/1.1 200 OK 
    Connection: Keep-Alive
    Content-Type: text/plain
    Date: Fri, 09 Apr 2010 11:25:07 GMT
    Server: WEBrick/1.3.1 (Ruby/1.8.7/2010-01-10)
    X-MyService-Git-Revision: 213addf
    Content-Length: 3370


## License

Copyright (c) 2010 Matthias Lüdtke <http://better-idea.org>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to
deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
