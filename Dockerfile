FROM composer:2
WORKDIR /app
COPY . .

RUN rm -rf vendor \
    && composer install \
    && composer dump-autoload

RUN wget https://get.symfony.com/cli/installer -O - | bash && \
    mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

RUN export PATH="$HOME/.symfony5/bin:$PATH"
    
RUN symfony server:ca:install

EXPOSE 8000

CMD ["symfony", "server:start", "--allow-http", "--no-tls", "--port=8000", "--listen-ip=0.0.0.0"]