$(document).ready(function(e){
      bindClickHandlers()
});
/////////////////////////////////// Meetups Index start ///////////////////////////
function bindClickHandlers() {
    $('#show-meetups').on('click', function(e) {
        e.preventDefault();
        let href = e.target.href
        fetch(href)
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
/////////////////////////////////// Meetups Index end ///////////////////////////
/////////////////////////////////// Meetup Show begin ///////////////////////////
$(() => {
  $('.show-meetups').on('click', `.gibberish`, function(e) {
      e.preventDefault()
      let href = $(this).attr("href")
      fetch(href)
      .then((res) => res.json())
      .then((meetup) => {
        $(".show-meetups").html("")
        let thisMeetup = new Meetup(meetup)
        $(".show-meetups").append(thisMeetup.formatShow())
      })
    })
  }) // end
// }) // end document ready

Meetup.prototype.formatShow = function() {
  let meetupHtml = `
  <h2> ${this.name}</h2>
  <p>${this.day} ${this.time}</p>
  <p>@ ${this.location} </p>
  ${displayTags(this.tags)}
  `
  return meetupHtml
}

function displayTags(tags) {
  let tagsHTML = "<ul>"
  tags.forEach((tag) => {
    tagsHTML += `<li>${tag.name}</li> `
  })
  tagsHTML += `</ul>`
  return tagsHTML
}
/////////////////////////////////////// comment submit function //////////////////////////////////////
$(function () {
    $('#comment-form').submit(function(event) {
      event.preventDefault();
      var values = $(this).serialize()
      var posting = $.post('/user_group/comment', values)

      posting.done(function(data) {
        let comment = "You said "
        comment += data["comment"]

        $('.comments').append(comment + '<br />')
      })
    })
  })
