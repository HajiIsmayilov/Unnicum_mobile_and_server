using Unnicum_Server.Models;

namespace Unnicum_Server.ViewModels
{
    public class RegisterRequest
    {
        public string Username { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public DateTimeOffset Birthday { get; set; }
        public bool IsJudge { get; set; }
        public Media Image { get; set; }
        public Address Address { get; set; }
        public List<ChallengeCategory> ChallengeCategories { get; set; } = new();
        public List<JudgementCategory> JudgementCategories { get; set; } = new();
    }
}
