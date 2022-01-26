using Unnicum_Server.Models.Abstraction;
using Unnicum_Server.Models.Enums;

namespace Unnicum_Server.Models
{
    public record Notification : Entity
    {
        public string Content { get; set; }
        public NotificationStatus NotificationStatus { get; set; }

        public int ImageId { get; set; }
        public Media Image { get; set; }
        public int UserId { get; set; }
        public User User { get; set; }
    }
}
