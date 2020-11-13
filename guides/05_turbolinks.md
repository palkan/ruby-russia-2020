# Установка и настройка Turbolinks

- `yarn add turbolinks`

- Инициализируем турболинки в JS:

```js
// packs/application.js
import '../init/turbolinks'

// init/turbolinks.js
import Turbolinks from 'turbolinks';

Turbolinks.start();
```

- Не забываем добавлять `data-turbolinks-track="reload"` для `link`/`script` тегов ассетов с дайджестами

- Подключаем гем Turbolinks (только его Ruby часть) для работы с не-GET запросами (`remote: true` формы, например):

```rb
# Gemfile
gem "turbolinks", require: "turbolinks/redirection"

# application_controller.rb
class ApplicationController < ActionController::Base
  include Turbolinks::Redirection
end
```

- Используем `data-turbolinks-permanent=[id]` для элементов, которые не нужно перезагружать.

- Игнорируем `connect` в Stimulus контроллерах для закешированных страниц:

```js
// utils/turbolinks.js
export const isPreview = () => {
  return document.documentElement.hasAttribute('data-turbolinks-preview');
};

// some_controller.js

import { isPreview as isTurbolinksPreview } from '../utils/turbolinks';

export default class extends Controller {
  connect() {
    if (isTurbolinksPreview()) return;

    // ...
  }
}
```

Полезно, если вы подключаетесь к Action Cable.

- А можно просто отключить превью совсем (он _ломается_ для динамических permanent атрибутов):

```html
<meta name="turbolinks-cache-control" content="no-preview">
```

## Lifecycle events

```txt
first visit: load
click: click before-visit request-start visit request-end before-cache before-render render load
back: visit before-cache before-render render load
cached: click before-visit request-start visit before-cache before-render render request-end before-render render load
```

## Прочее

- [Проблема со сбросом скролла при перезагрузке](https://github.com/turbolinks/turbolinks/issues/248)
- [Modern Multi Page Application: Turbolinks](http://www.modernmpa.com/turbolinks.html)
