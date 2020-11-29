import { Controller } from 'stimulus'
import FakeAudio from '../../utils/fake_audio'
import { secondsToDuration } from '../../utils/seconds_to_duration'

export default class extends Controller {
  static targets = ['progress', 'time']

  static classes = ['playing', 'forward', 'rewind']

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
    this.timeTarget.textContent = secondsToDuration(currentTime)
  }
}
