using System.Text.Json.Serialization;
using Unnicum_Server.Models.Abstraction;

namespace Unnicum_Server.Models
{
    public record SubCategory : Entity
    {
        public string Name { get; set; }

        public int CategoryId { get; set; }
        public Category Category { get; set; }
        [JsonIgnore]
        public virtual List<Post> Posts { get; set; } = new();

    }
}
