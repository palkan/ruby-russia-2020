import { Application } from 'stimulus'
import { definitionsFromContext } from 'stimulus/webpack-helpers'
import StimulusReflex from 'stimulus_reflex'
import { createCable } from '../init/cable'

const application = Application.start()
const consumer = createCable()

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

StimulusReflex.initialize(application, { consumer })
