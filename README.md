# RubyRussia 2020: Безфронтендная разработка на Rails

Данный репозиторий содержит код приложения для воркшопа «Безфронтендая разработка» в рамках конференции
[RubyRussia 2020](https://rubyrussia.club).

## Установка

Данный проект в первую очередь рассчитан на разработку в Docker-окружении и использует конфигурацию из статьи [Ruby on Whales](https://evilmartians.com/chronicles/ruby-on-whales-docker-for-ruby-rails-development).

Вам потребуется:

- `docker` и `docker-compose`.

См. [официальный сайт](https://docs.docker.com/engine/installation/).

- [`dip`](https://github.com/bibendi/dip).

Для развёртывания окружения выполните следующую команду из корня проекта:

```sh
dip provision
```

## Команды

Для запуска сервера Rails выполните команду:

```sh
dip rails s
```

Приложение будет доступно по адресу: [http://localhost:3000/](http://localhost:3000/).

Рекомендуется запускать webpack-dev-server в отдельной вкладке, чтобы наблюдать за его работой:

```sh
dip up webpacker
```

Для запуска тестов (мы используем RSpec) выполните одну из команд:

```sh
# только unit-тесты
dip rspec

# только системные тесты
dip rspec system
```

## Ссылки на материалы по теме воркшопа

- [Фронтенд без фронтенда](https://speakerdeck.com/palkan/rubyrussia-2020-frontiend-biez-frontienda)
- [Evil Front](https://evilmartians.com/chronicles/evil-front-part-3)

## Прочие ссылки

- [Ruby on Whales](https://evilmartians.com/chronicles/ruby-on-whales-docker-for-ruby-rails-development)
- [RuboCoping with legacy](https://evilmartians.com/chronicles/rubocoping-with-legacy-bring-your-ruby-code-up-to-standard)
- [System of a test](https://evilmartians.com/chronicles/system-of-a-test-setting-up-end-to-end-rails-testing)
