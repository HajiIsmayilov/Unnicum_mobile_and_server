using System.Text.Json.Serialization;
using Unnicum_Server.Models.Abstraction;
using Unnicum_Server.Models.Enums;

namespace Unnicum_Server.Models
{
    public record Media : Entity
    {
        public string Name { get; set; }
        public string Url { get; set; }
        public MediaType MediaType { get; set; }

        [JsonIgnore]
        public virtual User? User { get; set; }
        [JsonIgnore]
        public virtual Notification? Notification { get; set; }
        [JsonIgnore]
        public virtual Post? Post { get; set; }
    }
}
