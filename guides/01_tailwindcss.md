# Установка и настройка TailwindCSS

[Официальный сайт](https://tailwindcss.com/docs/installation).

1. Устанаваливаем NPM пакет:

```sh
dip yarn add tailwindcss
```

2. Добавляем `app/frontend/styles/application.scss` со следующим содержимым:

```css
@import "tailwindcss/base";
@import "tailwindcss/components";
@import "tailwindcss/utilities";
```

3. Добавляем импорт `application.css` в `application.js`:

```js
// app/frontend/packs/application.js

import '../styles/application.scss';
```

4. Создаём файл конфигурации и перемещаем его в папку `app/frontend`:

```sh
dip compose run webpacker npx tailwindcss init

mv tailwind.config.js app/frontend/tailwind.config.js
```

Мы не храним конфиг в корне проекта из-за [вот этой проблемы в Webpacker](https://github.com/rails/webpacker/pull/2771).

5. Добавляем `tailwind` в список PostCSS плагинов в `postcss.config.js`:

```js
module.exports = {
  plugins: [
    require('postcss-import'),
    require('tailwindcss')('./app/frontend/tailwind.config.js'),
    // ...
  ]
}
```

6. Настраиваем PurgeCSS:

```js
// tailwind.config.js
module.exports = {
  // Включаем будущие настройки по умолчанию
  future: {
    removeDeprecatedGapUtilities: true,
    purgeLayersByDefault: true,
  },
  purge: {
    // Указываем путь к файлам, где PurgeCSS будет искать используемые классы
    content: [
      // Все шаблоны в папке `app/frontend`
      './**/*.html.slim',
      // Все шаблоны в `app/views`
      '../views/**/*.html.slim',
    ],
  },
  // ...
}
```

См. [документацию PurgeCSS](https://purgecss.com/configuration.html#configuration-file) для списка доспутных опций.

6. Добавляем исключения для Stylelint:

```json
// .stylelintrc.json
{
  // ...
  "rules": {
    "at-rule-no-unknown": [
      true,
      {
        "ignoreAtRules": [
          "tailwind",
          "layer",
          "apply",
          "variants",
          "responsive",
          "screen"
        ]
      }
    ]
  }
}
```
