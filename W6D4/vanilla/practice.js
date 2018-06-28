Function.prototype.myCurry = function(steps) {
    const that = this
    const totalArgs = []

    return function _curry (...args) {

        for (let i = 0; i < args.length; i++) {
            totalArgs.push(args[i]);
            steps--
            if (steps === 0) return that(totalArgs)
        }
        return _curry
    }
}

function curry (cb, steps) {
    const totalArgs = []

    const cur = (...args) => {

        for (let i = 0; i < args.length; i++) {
            totalArgs.push(args[i]);
            steps--
            if (steps === 0) return cb(totalArgs)
        }

        return cur
    }

    return cur
}

function add (args) {
    return args.reduce((acc, x) => acc + x)
}

Function.prototype.myCall = function (context, ...args) {
    return this.bind(context)(args)
}

function bsearch (array, el) {
    if (array.length === 0) return null

    const middle = Math.floor(array.length/2)

    if (array[middle] === el) return middle

    if (array[middle] > el) {
        return bsearch(array.slice(0, middle), el)
    } else {
        const search = bsearch(array.slice(middle + 1), el)
        if (search) {
            return search + middle + 1
        } else {
            return null
        }
            
    }
}

Function.prototype.inherits = function (parent) {
    function Dummy () {}
    Dummy.prototype = parent.prototype
    this.prototype = new Dummy()
    this.prototype.constructor = this
}