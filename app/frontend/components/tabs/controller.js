import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['label', 'content']

  static classes = ['active', 'hidden']

  switch (e) {
    const index = this.labelTargets.indexOf(e.currentTarget)

    this.labelTargets.forEach((el, i) => {
      el.classList.toggle(this.activeClass, index === i)
    })

    this.contentTargets.forEach((el, i) => {
      el.classList.toggle(this.hiddenClass, index !== i)
    })
  }
}
