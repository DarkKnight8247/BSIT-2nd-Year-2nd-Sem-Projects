var builder = WebApplication.CreateBuilder(args);

// ADD THIS LINE: This registers your Controllers
builder.Services.AddControllers(); 

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

// ADD THIS LINE: This maps the routes in your StudentController
app.MapControllers(); 

// You can delete the app.MapGet("/weatherforecast"...) block entirely 
// if you want to remove the weather example from Swagger.

app.Run();