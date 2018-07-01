import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      num: "",
      result: 0,
      queue: []
    }

    this.setNum = this.setNum.bind(this)
    this.operation = this.operation.bind(this)
    this.evaluate = this.evaluate.bind(this)
    this.clear = this.clear.bind(this)
  }

  setNum (e) {
    const num = e.target.value;
    this.setState({ num })
  }

  operation (e, op) {
    e.preventDefault()
    if (e.target.value === '') return

    const queue = this.state.queue.concat(
      parseInt(e.target.value),
      op
    )

    const num = ''
    this.setState({ queue, num })
  }

  evaluate () {
    let queue = this.state.queue
    let result = 0

    for (let i = 0; i < queue.length; i += 4) {
      switch(queue[i+1]) {
        case '+':
          result += (queue[i] + queue[i+2])
          break
        case '-':
          result += (queue[i] - queue[i + 2])
          break
        case '*':
          result += (queue[i] * queue[i + 2])
          break
        case '/':
          result += (queue[i] / queue[i + 2])
          break
      }
    }
    queue = []
    this.setState({ queue, result })
  }

  clear (e) {
    e.preventDefault()
    this.setState({
      num: "",
      result: 0
    })
  }

  render() {
    const { num } = this.state
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input type="text" onChange={this.setNum} value={num} />

        <button onClick={(e) => {
          this.operation(e, '+')
        }} >+</button>

        <button onClick={(e) => {
          this.operation(e, '-')
        }} >-</button>

        <button onClick={(e) => {
          this.operation(e, '*')
        }} >*</button>

        <button onClick={(e) => {
          this.operation(e, '/')
        }} >/</button>

        <button onClick={this.evaluate}>=</button>

        <button onClick={this.clear} >Clear</button>
      </div>
    );
  }
}

export default Calculator;