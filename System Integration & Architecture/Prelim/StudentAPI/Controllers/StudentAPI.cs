using Microsoft.AspNetCore.Mvc;
using StudentAPI.Models;

namespace StudentAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentController : ControllerBase
    {
        // Mock database using a static list
        private static List<Student> students = new List<Student>
        {
            new Student { Id = 1, Name = "Patrick", Course = "IT" },
            new Student { Id = 2, Name = "Maria", Course = "CS" }
        };

        // GET: api/student (Retrieve all data)
        [HttpGet]
        public ActionResult<IEnumerable<Student>> GetStudents()
        {
            return Ok(students);
        }

        // GET: api/student/{id} (Retrieve specific data)
        [HttpGet("{id}")]
        public ActionResult<Student> GetStudent(int id)
        {
            var student = students.FirstOrDefault(s => s.Id == id);
            if (student == null)
            {
                return NotFound();
            }
            return Ok(student);
        }

        // POST: api/student (Create data)
        [HttpPost]
        public ActionResult<Student> AddStudent(Student student)
        {
            students.Add(student);
            return CreatedAtAction(nameof(GetStudent), new { id = student.Id }, student);
        }

        // PUT: api/student/{id} (Update data)
        [HttpPut("{id}")]
        public IActionResult UpdateStudent(int id, Student updatedStudent)
        {
            var student = students.FirstOrDefault(s => s.Id == id);
            if (student == null)
            {
                return NotFound();
            }

            student.Name = updatedStudent.Name;
            student.Course = updatedStudent.Course;
            return NoContent();
        }

        // DELETE: api/student/{id} (Remove data)
        [HttpDelete("{id}")]
        public IActionResult DeleteStudent(int id)
        {
            var student = students.FirstOrDefault(s => s.Id == id);
            if (student == null)
            {
                return NotFound();
            }

            students.Remove(student);
            return NoContent();
        }
    }
}