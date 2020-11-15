import { Application } from 'stimulus'
import { definitionsFromContext } from 'stimulus/webpack-helpers'

const application = Application.start()

const context = require.context('../components', true, /controller\.js/)

context.keys().forEach((path) => {
  const identifier = path.replace(/^\.\//, '')
    .replace(/\/controller\.js$/, '')
    .replace(/\//, '--')

  application.register(identifier, context(path).default)
})

// Regular controllers
const controllersContext = require.context('../controllers', true, /_controller\.js$/)
application.load(definitionsFromContext(controllersContext))
