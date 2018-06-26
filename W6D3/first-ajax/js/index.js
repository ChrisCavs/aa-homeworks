console.log("Hello from the JavaScript console!");

$.ajax({
    url: "http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b",
    type: "GET",
    success: widgetData => {
        console.log(widgetData);
    },
    error: er => {
        console.log(err);
    }
})

// fetch("http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b")
//     .then(res => console.log(res))
//     .catch(er => console.log(er));

console.log('end of program')
