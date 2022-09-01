document.addEventListener('turbolinks:load', function() {
  let new_user_form = document.querySelector('#new_user')

  if (new_user_form)
    { new_user_form.addEventListener('input', match ) }
})

function match() {
  let password = document.querySelector('#user_password')
  let password_confirmation = document.querySelector('#user_password_confirmation')

  if (!password_confirmation.value) {return;}

  if (password.value == password_confirmation.value) {
    password.style.border = '2px solid green'
    password_confirmation.style.border = '2px solid green'
    this.querySelector('.octicon-check').classList.remove('hide')
  } else {
    password.style.border = '2px solid red'
    password_confirmation.style.border = '2px solid red'
    this.querySelector('.octicon-check').classList.add('hide')
  }
}
