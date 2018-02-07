// change let to const

$(document).ready(function(e){
      bindClickHandlers()
      clearCommentBox()
});

function clearCommentBox(){
  $('#comment').focus(function() {
      $(this).val('');
  });
}
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
                        //this is from a live coding assignment ////
                        let button = `<button class="after-3">after 3?</button><br />`
                        $(".show-meetups").append(button)
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
    <a class="link-show" href="/groups/${meetup.group.id}/meetups/${meetup.id}" class="show-link"> ${meetup.name}</a>
    <p>${meetup.location} @ ${meetup.time}</p>
  `
  return postHTML
}
/////////////////////////////////// Meetups Index end ///////////////////////////
/////////////////////////////////// Meetup Show begin ///////////////////////////
$(() => {
  $('.show-meetups').on('click', `.link-show`, function(e) {
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
      const values = $(this).serialize()
      const posting = $.post('/user_group/comment', values)

      posting.done(function(data) {
        const comment = "You said "
        comment += data["comment"]

        $('#comment').attr('value', '')
        $('.comments').append(comment + '<br />')
      })
    })
  })

////////////////// live coding for review /////////////////
$(function () {
    $(document).on('click', '.after-3', function(event) {
      event.preventDefault();
      console.log(this)

      fetch("/after3")
      .then(res => res.json())
      .then(data => {
        $('.show-meetups').html("")
        data.forEach((meetup) => {

          const x = new Meetup(meetup)
          y = formatAfter3(x)
          console.log(y)
          $(".show-meetups").append(y)
        })
      })
    })
  })

  const formatAfter3 = (meetup) => {
    return `<p>${meetup.name}</p>
    <p>${meetup.day}</p>`
  }
