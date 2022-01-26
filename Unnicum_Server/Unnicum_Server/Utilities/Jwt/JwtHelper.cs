using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using Unnicum_Server.Models;

namespace Unnicum_Server.Utilities.Jwt
{
    public class JwtHelper
    {
        public static RefreshToken GenerateRefreshToken(string ipAddress)
        {
            byte[] number = new byte[32];

            using RandomNumberGenerator random = RandomNumberGenerator.Create();

            random.GetBytes(number);

            return new RefreshToken
            {
                Token = Convert.ToBase64String(number),
                Expires = DateTime.UtcNow.AddMinutes(15),
                Created = DateTime.UtcNow,
                CreatedByIp = ipAddress,
            };
        }


        public static string GenerateJwtToken(User user, AppSettings appSettings)
        {
            var tokenHandler = new JwtSecurityTokenHandler();

            var key = Encoding.ASCII.GetBytes(appSettings.Secret);

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.Name, user.Id.ToString())
                }),
                Expires = DateTime.UtcNow.AddMinutes(15),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);

            return tokenHandler.WriteToken(token);
        }
    }
}
