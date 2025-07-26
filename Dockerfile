FROM php:8.2-cli
WORKDIR /app
COPY . .

RUN rm -rf vendor \
    && if [ -f composer.json ]; then \
        curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
        && composer install \
        && composer dump-autoload; \
    fi

EXPOSE 8000

CMD ["php", "-S", "0.0.0.0:8000", "-t", "/app"]