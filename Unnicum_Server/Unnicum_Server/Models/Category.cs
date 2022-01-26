using Unnicum_Server.Models.Abstraction;

namespace Unnicum_Server.Models
{
    public record Category : Entity
    {
        public string Name { get; set; }

        public virtual List<ChallengeCategory> ChallengeCategories { get; set; } = new();
        public virtual List<JudgementCategory> JudgementCategories { get; set; } = new();
        public virtual List<SubCategory> SubCategories { get; set; } = new();
    }
}
