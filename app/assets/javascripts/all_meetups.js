$(document).ready(function(e){
  bindMeetups()
});

function bindMeetups() {
    $('.gibberish').on('click', function(e) {
        e.preventDefault();
        console.log("hijacked")
    })
}
