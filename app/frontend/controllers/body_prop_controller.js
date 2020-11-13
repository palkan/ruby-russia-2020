import { Controller } from 'stimulus'

export default class extends Controller {
  connect () {
    document.body.setAttribute(this.data.get('name'), true)
  }

  disconnect () {
    document.body.removeAttribute(this.data.get('name'))
  }
}
