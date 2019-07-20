$(() => {
  bindClickHandlers()
})


// below we use anonimyzed functions uses one argument.
// The parenthesis in (e) and (course) is not required

const bindClickHandlers = () => {
    $('.all_courses').on('click', (e) => {
      e.preventDefault()
      history.pushState(null,null,"courses")
      fetch('/courses.json')
        .then(res => res.json())
        .then(courses => {
          $('.container').html('')
          courses.forEach((course) => {
            let newCourse = new Course(course)
            let courseHtml = newCourse.formatIndex()
            $('.container').append(courseHtml)
          })
        })
    })
    $(document).on('click','.show_link',function(e) {
      e.preventDefault()
      let id = $(this).attr('data-id')
      fetch(`/courses/${id}.json`)
      .then(res => res.json())
      .then(course => {
        let newCourse = new Course(course)
        let courseHtml = newCourse.formatShow()
        $('.container').append(courseHtml)
      })
    })
}

function Course(course) {
  this.id = course.id
  this.name = course.name
  this.instructor = course.instructor
}

Course.prototype.formatIndex = function () {
  let courseHtml = `
  <a href="/courses/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.name}</h1></a>
  `
  return courseHtml
}

Course.prototype.formatShow = function () {
  let courseHtml = `
  <h3>${this.name}</h3>
  `
  return courseHtml
}
