using Unnicum_Server.Models;

namespace Unnicum_Server.ViewModels
{
    public class RegisterResponse
    {
        public int Id { get; set; }
        public string Email { get; set; }
        public string Username { get; set; }
        public string JwtToken { get; set; }

        public string RefreshToken { get; set; }

        public RegisterResponse(User user, string jwtToken, string refreshToken)
        {
            Id = user.Id;
            Email = user.Email;
            Username = user.Username;
            JwtToken = jwtToken;
            RefreshToken = refreshToken;
        }
    }
}
