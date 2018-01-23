$(document).ready(function() {


  $('.show-meetups').on('click', (e) =>{
    e.preventDefault()
    let id = $(this).attr('data-id')
    fetch(`/groups/1/meetups`)
    .then(res => res.json())
    .then(meetups => {
      //$('.show-meetups').append(meetups)
      console.log(meetups)
    })
  })
})
