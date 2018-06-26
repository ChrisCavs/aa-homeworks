/* jshint esversion: 6 */

function View($el) {
  this.$el = $el;
  this.setupEasel();
}

window._randomColorString = function(){
  return '#' + Math.random().toString(16).substr(-6);
};

View.prototype.exercise0 = function () {
  //Challenge: (example) remove the 'square' class from every li
  //Result: this should cause the grid to turn into a long list of undecorated lis
  //just a list of dots

  //this one completed as an example :) no additional code necessary
  $('li').removeClass("square");
};

View.prototype.exercise1 = function () {
  //Challenge: Give every square the class 'orange'
  //Result: Every square should turn orange (we already have a CSS rule)

  $('.square').addClass('orange');
  // document.querySelector('.square').classList.add('orange');
};

View.prototype.exercise2 = function () {
  //Challenge: Remove every square
  //Result: Every square vanishes

  $('.square').hide();
  // document.querySelector('.square').style.display = 'none';
};

View.prototype.exercise3 = function () {
  //Challenge: Add an <h1> with the text 'i love jquery' under the grid.
  //Result: An <h1> with the text 'i love jquery' appears under the grid.

  $('body').append("<h1>i love jquery</h1>");

  // const h1 = document.createElement('h1');
  // const textNode = document.createTextNode('i love jquery');
  // h1.appendChild(textNode);
  // document.querySelector('body').appendChild(h1);

  // document.querySelector('body').innerHTML += "<h1>i love jquery</h1>";
};

View.prototype.exercise4 = function () {
  //Challenge: Write your first name in every other square.
  //Result: Your name appears in every other square.



  Array.from(
    document.querySelectorAll('.square')
  ).forEach(item => {
    item.innerHTML = "CHRIS";
    console.log(item)
  });
};

View.prototype.exercise5 = function () {
  //Challenge: Alert the row and column of the square, when the square is clicked.
  //Result: When a square is clicked, the row and column appear in an alert. for
  //example: clicking the top left square should alert '0, 0'.

  //hint: checkout the addRow function at the bottom of the file: we set the
  //  'data-pos' of every square

  Array.from(
    document.querySelectorAll('.square')
  ).forEach(item => {
    item.addEventListener('click', (e) => {
      alert(`${e.target.dataset.pos}`);
    });
  });

  // $(".square").on('click', (e) => {
  //   const target = e.target;
  //   alert(`${target.data.pos}`);
  // })
};

View.prototype.exercise6 = function () {
  //Challenge: Give every square a random color!
  //Result: Every square becomes a color as soon as this code runs. The grid
  //should become a beautiful rainbow of colors.

  //hint: use window._randomColorString() (defined at top) to get a random color!

  Array.from(
    document.querySelectorAll('.square')
  ).forEach(item => {
    item.style.color = `${window._randomColorString()}`;
  });
};

View.prototype.exercise7 = function(){
  //Challenge: When your mouse goes over a square, console log its color.
  //Result: When the mouse goes over a square its color should appear in the
  //console. The color won't be the color's name, but its rbg value.
  //You should push the button for exercise 6 first to try it on the
  //rainbow.

  Array.from(
    document.querySelectorAll('.square')
  ).forEach(item => {
    item.addEventListener('click', e => {
      console.log(`${e.target.style.color}`);
    });
  });
};



View.prototype.setupEasel = function() {
  const $addRowButton = $('<button>').html('Add a row');
  this.$el.append($addRowButton);
  $addRowButton.on("click", this.addRow.bind(this));

  for(let j = 0; j <= 7; j++){
    const $button = $("<button>").html("Exercise " + j);
    $button.on("click", this["exercise" + j]);
    this.$el.append($button);
  }

  for(let i = 0; i < 20; i ++) {
    this.addRow();
  }
};

View.prototype.addRow = function() {
  const rowIdx = this.$el.find(".row").length;
  const $row = $("<ul>").addClass("row").addClass("group");
  for(let colIdx = 0; colIdx < 20; colIdx++) {
    const $square = $("<li>").addClass("square").attr("data-pos", [rowIdx, colIdx]);
    $square.on("mouseenter", (e) => {
      const $square = $(e.currentTarget);
      $square.css("background-color", window._randomColorString());
    });
    $row.append($square);
  }
  this.$el.append($row);
};

module.exports = View;
