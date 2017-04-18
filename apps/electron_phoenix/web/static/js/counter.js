import { Socket } from 'phoenix'

class Counter {
  constructor () {
    this.socket = new Socket('/socket', {
      logger: (kind, msg, data) => { console.log(`${kind}: ${msg}`, data) }
    })
    this.socket.connect()

    this.channel = this.socket.channel('counter:lobby', {})
    this.channel.join().receive('ok', () => console.log('join ok'))
    this.channel.onError(e => console.log('error: ', e))
    this.channel.onClose(e => console.log('channel closed', e))

    this.counter = document.querySelector('#counter')
  }

  increment () {
    let value = +this.counter.textContent
    this.channel.push('increment', { value })
      .receive('ok', response => {
        this.counter.textContent = response.value
      })
  }

  decrement () {
    let value = +this.counter.textContent
    this.channel.push('decrement', { value })
      .receive('ok', response => {
        this.counter.textContent = response.value
      })
  }

  incrementIfOdd () {
    let value = +this.counter.textContent
    this.channel.push('increment_if_odd', { value })
      .receive('ok', response => {
        this.counter.textContent = response.value
      })
  }

  incrementAsync () {
    setTimeout(() => this.increment(), 1000)
  }
}

export default Counter
