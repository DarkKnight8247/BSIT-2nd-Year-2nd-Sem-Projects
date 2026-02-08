using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Hosting;
using k.Models;
using System.Text.Json;

namespace JsonViewerMVC.Controllers
{
    public class HomeController : Controller
    {
        private readonly IWebHostEnvironment _env;

        // ✅ Dependency Injection happens hereF
        public HomeController(IWebHostEnvironment env)
        {
            _env = env;
        }
        public IActionResult Index()
        {
            var jsonPath = Path.Combine(_env.ContentRootPath, "Data", "data.json");

            if (!System.IO.File.Exists(jsonPath))
                return Content("JSON file not found!");

            var jsonString = System.IO.File.ReadAllText(jsonPath);

            if (string.IsNullOrWhiteSpace(jsonString))
                return Content("JSON file is empty!");

            var options = new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true
            };

            var data = JsonSerializer.Deserialize<List<SampleModel>>(jsonString, options);

            return View(data);
        }
    }
}