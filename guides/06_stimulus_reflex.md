# Установка и настройка StimulusReflex

[Официальная документация](https://docs.stimulusreflex.com).

- Настраиваем Action Cable (если ещё не был настроен). **Важно**: используем Redis в качестве pub/sub адаптера.

- Добавляем JS модуль с Action Cable в проект:

```js
// <frontend>/init/cable.js

import { createConsumer } from "@rails/actioncable";

let consumer;

export const createCable = () => {
  if (!consumer) {
    consumer = createConsumer();
  }

  return consumer;
}

export const createChannel = (...args) => {
  const consumer = createCable();
  return consumer.subscriptions.create(...args);
};
```

- Устанавливаем StimulusReflex согласно документации:

```sh
bundle add stimulus_reflex
yarn add stimulus_reflex
```

- **НE запускаем генератор** (`bundle exec rails stimulus_reflex:install`).

Он поломает нашу текущую конфигурацию для Stimulus) Б

- Подключаем StimulusReflex в `init/stimulus`:

```js
import StimulusReflex from 'stimulus_reflex'
import { createCable } from '../init/cable'

const application = Application.start()
const consumer = createCable()

// загрyжаем контроллеры

StimulusReflex.initialize(application, { consumer })
```

- Используем `cache_store` для хранения сессии:

```ruby
# config/application.rb
config.session_store :cache_store
```

В качестве `cache_store` можно использовать Redis или Memory (только в dev/test и если у вас один процесс веб-сервера).

**Внимание**: в тестовом окружении также необходимо использовать полноценный cache_store для корректной работы системных тестов.

- Подключаем гем для тестирования рефлексов:

```sh
bundle add stimulus_reflex_testing -g test
```

[Пример](https://github.com/anycable/anycable_rails_demo/pull/12)
