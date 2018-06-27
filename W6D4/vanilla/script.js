document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!

  const form = document.querySelector('.list-container > form')
  form.addEventListener('submit', (e) => {
    e.preventDefault()

    const inputEl = e.target[0]
    const val = inputEl.value
    inputEl.value = ''
    
    const list = document.querySelector('#sf-places');
    list.innerHTML += `<li>${val}</li>`
  })



  // adding new photos

  // --- your code here!

  const showButton = document.querySelector('.photo-show-button')
  const photoFormContainer = document.querySelector('.photo-form-container')

  showButton.addEventListener('click', (e) => {
    photoFormContainer.classList.remove('hidden')
  })

  const photoForm = photoFormContainer.querySelector('form')

  photoForm.addEventListener('submit', (e) => {
    e.preventDefault()
    const url = e.target[0].value
    const dogPhotos = document.querySelector('.dog-photos')
    dogPhotos.innerHTML += `<li><img src="${url}" /></li>`
  })
});
