using Unnicum_Server.Models.Abstraction;

namespace Unnicum_Server.Models
{
    public record JudgementCategory : Entity
    {
        public int UserId { get; set; }
        public User User { get; set; }
        public int CategoryId { get; set; }
        public Category Category { get; set; }
    }
}
