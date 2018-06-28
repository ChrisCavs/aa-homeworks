import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      num1: "",
      num2: "",
      result: 0
    }

    this.setNum1 = this.setNum1.bind(this)
    this.setNum2 = this.setNum2.bind(this)

    this.add = this.add.bind(this)
    this.subtract = this.subtract.bind(this)
    this.multiply = this.multiply.bind(this)
    this.divide = this.divide.bind(this)

    this.clear = this.clear.bind(this)
  }

  setNum1 (e) {
    const num1 = e.target.value;
    this.setState({ num1 })
  }

  setNum2 (e) {
    const num2 = e.target.value;
    this.setState({ num2 })
  }

  parse() {
    return [parseInt(this.state.num1), parseInt(this.state.num2)]
  }

  add (e) {
    e.preventDefault()
    const result = this.parse().reduce((acc, x) => acc + x)
    this.setState({ result })
  }

  subtract (e) {
    e.preventDefault()
    const result = this.parse().reduce((acc, x) => acc - x)
    this.setState({ result })
  }

  multiply (e) {
    e.preventDefault()
    const result = this.parse().reduce((acc, x) => acc * x)
    this.setState({ result })
  }

  divide (e) {
    e.preventDefault()
    const result = this.parse().reduce((acc, x) => acc / x)
    this.setState({ result })
  }

  clear (e) {
    e.preventDefault()
    this.setState({
      num1: "",
      num2: ""
    })
  }

  render() {
    const { num1, num2 } = this.state
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input type="text" onChange={this.setNum1} value={num1} />
        <input type="text" onChange={this.setNum2} value={num2} />

        <button onClick={this.add} >Add</button>
        <button onClick={this.subtract} >Subtract</button>
        <button onClick={this.multiply} >Multiply</button>
        <button onClick={this.divide} >Divide</button>

        <button onClick={this.clear} >Clear</button>
      </div>
    );
  }
}

export default Calculator;