// $(() => {
//   bindClickHandlers()
// })// end document ready

$(document).ready(function(){
      bindClickHandlers()
});
/////////////////////////////////// Show meetups Index start ///////////////////////////

const bindClickHandlers = () => {
    $('#show-meetups').on('click', (e) =>{
        e.preventDefault()
        let href = e.target.href
        fetch(`${href}`)
        .then(res => res.json())
        .then(meetups => {
          $(".show-meetups").html("")

          meetups.forEach((meetup) => {
            let newMeetup = new Meetup(meetup)
            let postHTML = formatIndex(newMeetup)
            $(".show-meetups").append(postHTML)
          })
        })
    }) // end of click handler
}// end bindClickHandlers
  // counstructor
function Meetup(meetup) {
  this.location = meetup.location
  this.id = meetup.id
  this.name = meetup.name
  this.day = meetup.day
  this.time = meetup.time
  this.tags = meetup.tags
  this.group = meetup.group
}

let formatIndex = function(meetup) {
  let postHTML = `
    <a class="gibberish" href="/groups/${meetup.group.id}/meetups/${meetup.id}" class="show-link"> ${meetup.name}</a>
    <p>${meetup.location} @ ${meetup.time}</p>
  `
  return postHTML
}
/////////////////////////////////// Show meetups Index end ///////////////////////////
/////////////////////////////////// Meetup Show Page begin ///////////////////////////
$(() => {
  $('.show-meetups').on('click', `.gibberish`, function(e) {
//    console.log($(this).attr("class"))
      e.preventDefault()
      let href = $(this).attr("href")
      fetch(href)
      .then((res) => res.json())
      .then((meetup) => {
        $(".show-meetups").html("")
        let newMeetup = new Meetup(meetup)
        let postHTML = formatFullMeetupContent(newMeetup)
        $(".show-meetups").append(postHTML)
        console.log(meetup)
      })
    })
  }) // end
// }) // end document ready

let formatFullMeetupContent = function(meetup) {
  let postHTML = `
    <h2> ${meetup.name}</h2>
    <p>${meetup.day} ${meetup.time}</p>
    <p>@ ${meetup.location} </p>
    ${displayTags(meetup.tags)}
  `
  return postHTML
}

function displayTags(tags) {
  let tagsHTML = "<ul>"
  tags.forEach((tag) => {
    tagsHTML += `<li>${tag.name}</li> `
  })
  tagsHTML += `</ul>`
  return tagsHTML
}
/////////////////////////////////////// next.. //////////////////////////////////////
$(() => {
    $('#comment-form').submit((e) =>{
        e.preventDefault()
        var values = $(e.target)
        console.log(values)
        // var posting = $.post('/user_group/comment', values);
        // console.log(posting)
        // posting.done(function(data) {
        //   var post = data;
        //   console.log(data)
                  // $("#postTitle").text(post["title"]);
                  // $("#postBody").text(post["description"]);
        // });
    }) // end
}) // end document ready
