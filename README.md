# symfony-boilerplate
Docker container to get started with Symfony 2.7 LTS and much more.

## What's inside

* PHP 5.6
* Symfony 2.7 LTS
* Nginx
* Node.js / NPM
* MySQL
* Redis
* Elasticsearch
* Blackfire Profiler
* Gulp.js
* Bower

### Gulp.js build system

* Browserify (incl. Babel.js ES6 transpiler)
* SASS compilation
* Automatic file watcher

## Prerequisites

Install [Docker](https://www.docker.com/) on your system.

* [Install instructions](https://docs.docker.com/installation/mac/) for Mac OS X
* [Install instructions](https://docs.docker.com/installation/ubuntulinux/) for Ubuntu Linux
* [Install instructions](https://docs.docker.com/installation/) for other platforms

Install [Docker Compose](http://docs.docker.com/compose/) on your system.

* [Install instructions](https://docs.docker.com/installation/) for all supported systems

Optionally, I suggest that you use [docker-machine](https://docs.docker.com/machine/) for managing your Docker hosts.

## Get up and running

1. Download or clone this repository

    ```bash
    $ git clone https://github.com/b00giZm/symfony-boilerplate.git
    ```

2. Copy `app/.env.example` to `app/.env` so Docker (and later Symfony) can use it.

    ```bash
    $ cd code/symfony-boilerplate; cp app/.env.example app/.env
    ```

3. Build your Docker development container container: It will pull a [base image](https://registry.hub.docker.com/_/ubuntu/) from the Docker registry and install all necessary dependencies (This might take a while, depending on your host system).

    ```bash
    $ docker-compose build
    ```

4. Create and start the main Docker container and attach all linked containers. For your very first run, this will also take a while, because docker-compose first needs to pull the images for all linked containers.

    ```bash
    $ docker-compose up -d
    ```

5. Install PHP dependencies through [Composer](https://getcomposer.org), which you installed during step 1.

    ```bash
    $ docker-compose run --no-deps web composer update
    ```

6. Install Node.js dependencies through [npm](https://www.npmjs.com), which you did also install during the first step.

    ```bash
    $ docker-compose run --no-deps web npm install
    ```
    
7. Install frontend components through [Bower](http://bower.io/), which you did also install during the first step.

    ```bash
    $ docker-compose run --no-deps web bower install
    ```

8. Build all frontend Javascripts and CSS files, contained in the `FrontendBundle`, with [Gulp.js](http://gulpjs.com/) and watch file changes for automatic rebuilds.

    ```bash
    $ docker-compose run --no-deps web gulp
    ```

    What it does:

    * It compiles all [SASS](http://sass-lang.com) stylesheets inside `src/FrontendBundle/Resouerces/public/sass` to CSS.
    * It compiles Javascripts inside `src/FrontendBundle/Resouerces/public/lib` with [Browserify](http://browserify.org). You can use ES6 and ES7 syntax and features, if you want. Browserify takes care of compiling everyhing to 100% browser compatible Javascript.

9. You can then access the app, which should then be running on your docker daemon on HTTP port 8000 (On OS X you can use `docker-machine env dev` to find out the IP address). For convenience, I created a `localdocker.dev` entry in my `/etc/hosts` which points to that IP.

    ```bash
    $ open http://localdocker.dev:8000/app_dev.php
    ```

![symfony-boilerplate](https://raw.githubusercontent.com/b00giZm/symfony-boilerplate/master/screenshot.png)

**Now go and build something awesome! 🙏**

## Alternative Way

Instead of running steps 5) to 8) as `docker-compose` on/off commands, you can run them directly inside the container:

```bash
$ docker-compose run --no-deps web bash
root@ee746ce03589:/code/app $ composer update
...
root@ee746ce03589:/code/app $ npm install
...
root@ee746ce03589:/code/app $ bower install
...
root@ee746ce03589:/code/app $ gulp watch
```

This really is my preferred way, because it involves less typing and it feels more "natural", because you may need to initiate several commands via the CLI on a regular base (creating class skeletons, running database migrations etc.)

## Blackfire.io Support

If you want to use the [Blackfire](https://blackfire.io) profiler, we got you covered as well. Just fill in your Blackfire credentials in `app/.env` (after you copied it from `app/.env.example`) and you're good to go.

```bash
BLACKFIRE_SERVER_ID=YourBlackfireServerID
BLACKFIRE_SERVER_TOKEN=YourBlackfireServerToken
BLACKFIRE_CLIENT_ID=YourBlackfireClientID
BLACKFIRE_CLIENT_TOKEN=YourBlackfireClientToken
BLACKFIRE_LOG_LEVEL=4
```

## Maintainer

Pascal Cremer

* Email: <hello@codenugget.co>
* Twitter: [@b00gizm](https://twitter.com/b00gizm)
* Web: [http://codenugget.co](http://codenugget.co)

## License

> The MIT License (MIT)
>
> Copyright (c) 2015 Pascal Cremer
>
>Permission is hereby granted, free of charge, to any person obtaining a copy
>of this software and associated documentation files (the "Software"), to deal
>in the Software without restriction, including without limitation the rights
>to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>copies of the Software, and to permit persons to whom the Software is
>furnished to do so, subject to the following conditions:
>
>The above copyright notice and this permission notice shall be included in all
>copies or substantial portions of the Software.
>
>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
>AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
>SOFTWARE.
