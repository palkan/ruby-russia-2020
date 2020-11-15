export const secondsToDuration = (seconds) => {
  const min = (seconds / 60) | 0
  const sec = (seconds % 60) | 0

  const minStr = min > 9 ? min : `0${min}`
  const secStr = sec > 9 ? sec : `0${sec}`

  return `${minStr}:${secStr}`
}
