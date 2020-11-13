import { Application } from 'stimulus'

const application = Application.start()

const context = require.context('../components', true, /controller\.js/)

context.keys().forEach((path) => {
  const identifier = path.replace(/^\.\//, '')
    .replace(/\/controller\.js$/, '')
    .replace(/\//, '--')

  application.register(identifier, context(path).default)
})
