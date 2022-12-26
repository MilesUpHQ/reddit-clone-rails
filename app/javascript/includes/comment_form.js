document.querySelectorAll('.comment-form-display').forEach((el) => {
    el.addEventListener('click', (ev) => {
     ev.preventDefault();
     el.nextElementSibling.style = 'display: block;'
    })
  })