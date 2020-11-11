# Установка и настройка ShoeLace

Следуем [официальной инструкции для Rails](https://shoelace.style/tutorials/integrating-with-rails) со следующими поправками:

- Выносим Shoelace в отдельный pack:

```js
// app/frontend/packs/shoelace.js

// Указываем eslint на то, что этот метод определен в глобальной области видимости
/* global customElements */

import '../styles/shoelace.scss'

import { setAssetPath, SlDropdown, SlMenu, SlMenuItem } from '@shoelace-style/shoelace'

const rootUrl = document.currentScript.src.replace(/\/packs.*$/, '')

// Используем фиксированный путь к инонкам. Он не должен зависеть от окружения и
// способа загрузки скриптов (например, webpack-dev-server)
setAssetPath(rootUrl + '/packs/js/icons')
customElements.define('sl-dropdown', SlDropdown)
customElements.define('sl-menu', SlMenu)
customElements.define('sl-menu-item', SlMenuItem)
// и другие компоненты
```

```css
/* app/frontend/styles/shoelace.scss */
@import '@shoelace-style/shoelace/dist/shoelace/shoelace';

:root {
  /* Кастомизация базовых настроек */
}
```

- Подключаем Shoelace в head страницы:

```slim
head
  = stylesheet_pack_tag "shoelace"
  = javascript_pack_tag "shoelace"
```

Обратите внимание, что мы не используем `defer: true`: мы хотим, чтобы компоненты были зарегистрированы на момент рендеринга. По этой же причине мы и вынесли Shoelace в отдельный pack.

- Настраиваем stylelint для работы с Custom Elements:

```json
// .stylelintrc.json
{
  // ...
  "rules": {
    "selector-type-no-unknown": [
      true,
      {
        "ignore": ["custom-elements"]
      }
    ]
  }
}
```
