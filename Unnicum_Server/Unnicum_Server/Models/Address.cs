using System.Text.Json.Serialization;
using Unnicum_Server.Models.Abstraction;

namespace Unnicum_Server.Models
{
    public record Address : Entity
    {
        public string Name { get; set; }
        public double Longtitude { get; set; }
        public double Latitude { get; set; }

        [JsonIgnore]
        public virtual User? User { get; set; }
        [JsonIgnore]
        public virtual List<Post> Posts { get; set; } = new();
    }
}
