symfony-boilerplate AppBundle
=============================

This is a minimal bundle, which you can use to get started with Symfony. It's got a `DefaultController` whose `indexAction` will be executed, if you navigate to the base URL, e.g. [http://localdocker.dev:8000/](http://localdocker.dev:8000/)

Configuration
-------------

All configuration is done on "app level", inside `/app/config`. In order to deal with the dynamic hosts and port configs of all linked Docker containers, we use `/app/config/parameters.php` in combination with environment variables, instead of the more "traditional" `/app/config/parameters.ini`.

Instead of utilizing full-blown Symfony bundles for using the linked [Redis](http://redis.io/) and [Elasticsearch](https://www.elastic.co/products/elasticsearch) containers, 3rd party libraries are used and exposed as services inside the Symfony DIC. Those services offer only very minimal configuration, just barely enough to be useful. Feel free to extend them based on your needs, or to use 3rd party bundles like the [SncRedisBundle](https://github.com/snc/SncRedisBundle) for Redis.

### Redis

* [Homepage](http://redis.io/)
* 3rd Party Library: [Predis](https://github.com/nrk/predis/)
* Service(s): `predis.client`

### Elasticsearch

* [Homepage](https://www.elastic.co/products/elasticsearch)
* 3rd Party Library: [Elastica](http://elastica.io/)
* Service(s): `elastica.client`, `elastica.search`

Maintainer
----------

Pascal Cremer

* Email: <hello@codenugget.co>
* Twitter: [@b00gizm](https://twitter.com/b00gizm)
* Web: [http://codenugget.co](http://codenugget.co)

License
-------

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