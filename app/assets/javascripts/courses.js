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
      $('.ajaxStyling').html('')
      let id = $(this).attr('data-id')
      fetch(`/courses/${id}.json`)
      .then(res => res.json())
      .then(course => {
        let newCourse = new Course(course)
        let courseHtml = newCourse.formatShow()
        $('.ajaxStyling').append(courseHtml)
      })
    })


    $('#new_course').on('submit', function(e) {
    e.preventDefault()

    const values = $(this).serialize()

    $.post('/courses', values).done(function(data) {
      $('.ajaxStyling').html('')
      const newCourse = new Course(data)
      const htmlToAdd = newCourse.formatShow()
      $('.ajaxStyling').html(htmlToAdd)

    })
  })
}

const getCourses = () => {
  fetch('/courses.json')
    .then(res => res.json())
    .then(courses => {
      $('.ajaxStyling').html('')
      courses.forEach((course) => {
        let newCourse = new Course(course)
        let courseHtml = newCourse.formatIndex()
        $('.ajaxStyling').append(courseHtml)
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
  <a href="/courses/${this.id}" data-id="${this.id}"><h3 class="showText">${this.name} by ${this.instructor}</h3></a>
  `
  return courseHtml
}
