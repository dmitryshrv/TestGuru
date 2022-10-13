
document.addEventListener('turbolinks:load', function() {
  let timer = document.querySelector('.timer')

  if (timer){
    setInterval(timerStart, 1000)
  }
})

function timerStart(){
  timer = document.querySelector('.timer')
  time = parseInt(timer.dataset.time)
  if (time > 0){
    document.querySelector('.timer').textContent = formatTime(time)
    document.querySelector('.timer').dataset.time = time-1
  } else {
    redirect()
    clearInterval(timerStart)
  }
}

function formatTime(time){
  seconds = Math.trunc(time%60)
  minutes = Math.trunc(time/60%60)
  return `${minutes.toString().padStart(2, "0")}:${seconds.toString().padStart(2, "0")}`
}

function redirect(){
  document.querySelector('.update-button').click()
}
