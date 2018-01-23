$(document).ready(function() {


  $('.show-meetups').on('click', (e) =>{
    e.preventDefault()
    let id = $(this).attr('data-id')
    fetch(`/groups/1/meetups`)
    .then(res => res.json())
    .then(meetups => {
      //$('.show-meetups').append(meetups)
      meetups.forEach((meetup) => {
        let newMeeup = new Meetup(meetup)
      })
    })
  }) // end of click handler
})// end document ready

  // counstructor
function Meetup(meetup) {
  this.location = meetup.location
  this.id = meetup.id
  this.name = meetup.name
  this.day = meetup.day
  this.time = meetup.time
  this.group_id = meetup.group_id
  console.log(this)
}
