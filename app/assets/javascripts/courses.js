$(() => {
  bindClickHandlers()
})


// below we use anonimyzed functions uses one argument.
// The parenthesis in (e) and (course) is not required

const bindClickHandlers = () => {
    $('.all_courses').on('click', (e) => {
      e.preventDefault()
      history.pushState(null,null,"courses")
      getCourses()
    })
    $(document).on('click','.show_link',function(e) {
      e.preventDefault()
      $('.container').html('')
      let id = $(this).attr('data-id')
      fetch(`/courses/${id}.json`)
      .then(res => res.json())
      .then(course => {
        let newCourse = new Course(course)
        let courseHtml = newCourse.formatShow()
        $('.container').append(courseHtml)
      })
    })

    $(document).on('click', '.nextCourse', function() {
      let id = $(this).attr('data-id')
      fetch(`courses/${id}/next`)
  })

    $('#new_course').on('submit', function(e) {
    e.preventDefault()

    const values = $(this).serialize()

    $.post('/courses', values).done(function(data) {
      $('.container').html('')
      const newCourse = new Course(data)
      const htmlToAdd = newCourse.formatShow()
      $('.container').html(htmlToAdd)

    })
  })
}

const getCourses = () => {
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
  <button class="nextCourse">Next</button>
  `
  return courseHtml
}
