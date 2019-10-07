FROM php:7.2-fpm

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get update && apt-get install -y \
#    mysql-client \
    default-mysql-client \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    nano \
    curl \
    wget \
    software-properties-common \
    build-essential \
    python \
    libglib2.0-dev \
    nodejs

# build v8 module

RUN cd /tmp && git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
ENV PATH /tmp/depot_tools:$PATH

RUN cd /tmp && fetch v8
RUN cd /tmp/v8 && git checkout 7.5.289 && gclient sync -D
#RUN cd /tmp/v8 && git checkout 6.4.388.18 && gclient sync -D

RUN cd /tmp/v8 && tools/dev/v8gen.py -vv x64.release -- is_component_build=true use_custom_libcxx=false

RUN cd /tmp/v8 && ninja -C out.gn/x64.release/

RUN mkdir -p /opt/v8/lib
RUN mkdir /opt/v8/include
RUN cd /tmp/v8 && cp out.gn/x64.release/lib*.so out.gn/x64.release/*_blob.bin /opt/v8/lib/
RUN cd /tmp/v8 && cp out.gn/x64.release/icudtl.dat /opt/v8/lib/
RUN cd /tmp/v8 && cp -R include/* /opt/v8/include/

RUN cd /tmp && git clone https://github.com/phpv8/v8js.git
#RUN git clone https://github.com/phpv8/v8js.git /tmp/v8js \
#    && cd /tmp/v8js \
#    && phpize \
#    && ./configure --with-v8js=/opt/v8
RUN cd /tmp/v8js && phpize
RUN cd /tmp/v8js && ./configure LDFLAGS="-lstdc++" --with-v8js=/opt/v8
#ENV NO_INTERACTION 1
#RUN cd /tmp/v8js \
#    && make \
#    && ls -l modules \
#    && make test \
#    && make install
RUN cd /tmp/v8js && make
RUN cd /tmp/v8js && make test
RUN cd /tmp/v8js && make install
RUN echo extension=v8js.so >> /usr/local/etc/php/conf.d/v8js.ini
#
RUN curl -L -o /usr/local/bin/phpunit https://phar.phpunit.de/phpunit.phar
RUN chmod +x /usr/local/bin/phpunit

RUN curl -L -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x /usr/local/bin/wp

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install extensions
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl
RUN docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/
RUN docker-php-ext-install gd

# Copy composer.lock and composer.json
COPY composer.lock composer.json /var/www/

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#RUN cd /var/www && rm -rf node_module && npm i && npm i -y vue \
#     vue-server-renderer \
#     vue-router

#RUN cd /var/www/ && npm run prod

RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

COPY . /var/www

COPY --chown=www:www . /var/www

USER www

# Expose port 9000 and start php-fpm server
EXPOSE 9000

CMD ["php-fpm"]
