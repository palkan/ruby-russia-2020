/* global Event */

export default class {
  constructor (element, duration) {
    this.targetElement = element
    this.duration = duration
    this.currentTime = 0.0
    this.tick = this.tick.bind(this)
  }

  play () {
    if (this.playing) return

    this.tickTid = setInterval(this.tick, 500)
    this.playing = true
  }

  pause () {
    if (!this.playing) return

    clearInterval(this.tickTid)
    this.playing = false
  }

  seek (value) {
    this.currentTime = value
    this.dispatch('timeupdate')
  }

  tick () {
    this.currentTime += 0.5

    this.dispatch('timeupdate')
  }

  dispatch (type) {
    const event = new Event(type)
    this.targetElement.dispatchEvent(event)
  }

  dispose () {
    this.pause()
    delete this.targetElement
  }

  set currentTime (val) {
    this._currentTime = val
  }

  get currentTime () {
    return this._currentTime
  }
}
