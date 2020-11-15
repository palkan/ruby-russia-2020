# Установка и настройка StimulusJS

[Официальная инструкция](https://stimulusjs.org/handbook/installing)

[Установка версии 2.0](https://discourse.stimulusjs.org/t/how-to-install-stimulus-2-0-preview-release/1325) ([что нового](https://github.com/stimulusjs/stimulus/pull/202)).

## Интеграция с компонентами

Для автоматической загрузки контроллеров для компонентов согласно CoC, можно использовать следующий код:

```js
// app/frontend/init/stimulus.js
import { Application } from 'stimulus';

const application = Application.start();

const context = require.context('../components', true, /controller\.js/)

context.keys().forEach((path) => {
  let identifier = path.replace(/^\.\//, '')
                       .replace(/\/controller\.js$/, '')
                       .replace(/\//, '--')

  application.register(identifier, context(path).default);
});
```

Теперь, если вы определите компоненте в файле `app/frontend/components/my/example/controller.js`,
он будет доступен через идентификатор `my--example`.

## Интеграция со StandardJS

По умолчанию StandardJS не работает с синтаксисом ES7+. Нам нужно использовать сторонний парсер, например, babel-eslint.

Для это мы добавляем пакет:

```sh
yarn add babel-eslint --dev
```

И указываем в package.json:

```json
"standard": {
  "parser": "babel-eslint"
}
```
