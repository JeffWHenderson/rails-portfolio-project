$(() => {
  $('#get-day').on('click', (e) =>{
      e.preventDefault()
      console.log("hijacked")
})// end document ready
/////////////////////////////////// Show meetups Index start ///////////////////////////

// const bindClickHandlers = () => {
    //     let href = e.target.href
    //
    //     fetch(`${href}`)
    //     .then(res => res.json())
    //     .then(meetups => {
    //       $(".show-meetups").html("")
    //       //$('.show-meetups').append(meetups)
    //       meetups.forEach((meetup) => {
    //         let newMeetup = new Meetup(meetup)
    //         let postHTML = formatIndex(newMeetup)
    //         //let postHTML = newMeetup.formatIndex // this is taking the html template from the prototype
    //         $(".show-meetups").append(postHTML)
    //       })
    //     })
    }) // end of click handler
// }// end bindClickHandlers


//   // counstructor
// function Meetup(meetup) {
//   this.location = meetup.location
//   this.id = meetup.id
//   this.name = meetup.name
//   this.day = meetup.day
//   this.time = meetup.time
//   this.groupId = meetup.group_id
// }
//
// let formatIndex = function(meetup) {
//   let postHTML = `
//     <a href="/groups/${meetup.groupId}/meetups/${meetup.id}" ><h3> ${meetup.name}</h3></a>
//     <p>${meetup.location} @ ${meetup.time}</p>
//   `
//   return postHTML
// }
