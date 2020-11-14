/* global Event */

import { Controller } from 'stimulus'

class FakeAudio {
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

export default class extends Controller {
  static targets = ['progress', 'time']

  static classes = ['playing']

  static values = {
    duration: Number,
    track: Number
  }

  initialize () {
    this.updateTime = this.updateTime.bind(this)
  }

  trackValueChanged () {
    if (this.audio) {
      this.audio.dispose()
    }
    this.audio = new FakeAudio(this.element, this.durationValue)
    this.play()
  }

  play () {
    this.element.classList.toggle(this.playingClass)
    this.audio.play()
  }

  pause () {
    this.element.classList.toggle(this.playingClass)
    this.audio.pause()
  }

  seek (e) {
    const position = (e.offsetX / e.currentTarget.offsetWidth) * this.durationValue
    this.audio.seek(position)
  }

  updateTime () {
    const currentTime = this.audio.currentTime

    const percent = (currentTime * 100) / this.durationValue

    this.progressTarget.style.width = `${percent}%`

    const minutes = (currentTime / 60) | 0
    const seconds = (currentTime % 60) | 0

    const minutesStr = minutes > 9 ? minutes : `0${minutes}`
    const secondsStr = seconds > 9 ? seconds : `0${seconds}`

    this.timeTarget.textContent = `${minutesStr}:${secondsStr}`
  }
}
