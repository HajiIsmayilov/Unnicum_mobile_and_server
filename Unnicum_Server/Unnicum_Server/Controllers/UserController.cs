using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Unnicum_Server.Models;
using Unnicum_Server.Repo;
using Unnicum_Server.Utilities.Hashing;
using Unnicum_Server.Utilities.Jwt;
using Unnicum_Server.ViewModels;

namespace Unnicum_Server.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly AppSettings _appSettings;

        public UserController(IUnitOfWork unitOfWork, IOptions<AppSettings> appSettings)
        {
            _unitOfWork = unitOfWork;
            _appSettings = appSettings.Value;
        }

        [AllowAnonymous]
        [HttpPost("Register")]
        public async Task<IActionResult> Register([FromBody] RegisterRequest model)
        {
            try
            {
                User user = new()
                {
                    Username = model.Username,
                    Email = model.Email,
                    Birthday = model.Birthday,
                    IsJudge = model.IsJudge,
                    Image = model.Image,
                    Address = model.Address,
                    ChallengeCategories = model.ChallengeCategories,
                    JudgementCategories = model.JudgementCategories,
                };

                var jwtToken = JwtHelper.GenerateJwtToken(user, _appSettings);

                var refreshToken = JwtHelper.GenerateRefreshToken(IpAddress());

                HashingHelper.CreatePasswordHash(model.Password, out var passwordHash, out var passwordSalt);

                user.PasswordHash = passwordHash;

                user.PasswordSalt = passwordSalt;

                user.RefreshTokens.Add(refreshToken);

                _unitOfWork.UserRepository.Add(user);

                await _unitOfWork.SaveAsync();

                return Ok(new RegisterResponse(user, jwtToken, refreshToken.Token!));
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [AllowAnonymous]
        [HttpPost("Login")]
        public async Task<IActionResult> Authenticate([FromBody] AuthenticateRequest model)
        {
            try
            {
                //  var user = await _userRepo.GetAsync(x => x.Email == model.Email);
                var user = await _unitOfWork.UserRepository.GetAsync(x => x.Email == model.Email);

                if (user != null)
                    if (!HashingHelper.VerifyPasswordHash(model.Password, user.PasswordHash, user.PasswordSalt))
                        user = null;

                if (user == null)
                    return BadRequest(new { message = "Username or password is incorrect" });

                var jwtToken = JwtHelper.GenerateJwtToken(user, _appSettings);

                var refreshToken = JwtHelper.GenerateRefreshToken(IpAddress());

                user.RefreshTokens.Add(refreshToken);

                // _userRepo.Update(user);
                _unitOfWork.UserRepository.Update(user);

                //await _userRepo.SaveAsync();

                await _unitOfWork.SaveAsync();

                return Ok(new AuthenticateResponse(user, jwtToken, refreshToken.Token!));
            }
            catch (Exception)
            {
                return BadRequest(new { message = "Username or password is incorrect" });
            }
        }

        [AllowAnonymous]
        [HttpPost("Refresh-token")]
        public async Task<IActionResult?> RefreshToken([FromBody] RefreshTokenRequest model)
        {
            try
            {
                var user = await _unitOfWork.UserRepository.GetAsync(u =>
                    u.RefreshTokens.Any(t => t.Token == model.Token));

                if (user == null)
                    return BadRequest();

                var refreshToken = await _unitOfWork.RefreshTokenRepository.GetAsync(x => x.Token == model.Token);

                if (refreshToken!.IsActive)
                    return BadRequest();

                var ipAddress = IpAddress();

                var newRefreshToken = JwtHelper.GenerateRefreshToken(ipAddress);

                refreshToken.Revoked = DateTime.UtcNow;

                refreshToken.RevokedByIp = ipAddress;

                refreshToken.ReplacedByToken = newRefreshToken.Token;

                user.RefreshTokens.Add(newRefreshToken);

                _unitOfWork.UserRepository.Update(user);

                await _unitOfWork.SaveAsync();

                var jwtToken = JwtHelper.GenerateJwtToken(user, _appSettings);

                return Ok(new AuthenticateResponse(user, jwtToken, newRefreshToken.Token!));
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpPost("LogOut")]
        public async Task<IActionResult> RevokeToken([FromBody] RevokeTokenRequest model)
        {
            try
            {
                var user = await _unitOfWork.UserRepository.GetAsync(u =>
                    u.RefreshTokens.Any(t => t.Token == model.Token));

                if (user == null)
                    return BadRequest();

                var refreshToken = await _unitOfWork.RefreshTokenRepository.GetAsync(x => x.Token == model.Token);

                if (!refreshToken!.IsActive)
                    return BadRequest();

                refreshToken.Revoked = DateTime.UtcNow;

                refreshToken.RevokedByIp = IpAddress();

                _unitOfWork.UserRepository.Update(user);

                await _unitOfWork.SaveAsync();

                return Ok(new { message = "Token revoked" });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpPost("BlockedUser")] //search de nezere al
        public async Task<IActionResult> BlockedUser([FromBody] BlockedUserRequest model)
        {
            try
            {
                var user = await _unitOfWork.UserRepository.GetAsync(u => u.Username == model.BlockedUserName);

                if (user == null)
                    return BadRequest();

                var blockedUser = new BlockedUser
                {
                    BlockedId = user.Id,
                    WhoBlockedId = model.UserId
                };

                _unitOfWork.BlockedUserRepository.Add(blockedUser);

                // await _blockRepository.SaveAsync();

                await _unitOfWork.SaveAsync();

                return Ok();
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpGet("GetUser/{id:int}")]
        public async Task<IActionResult> GetById(int id)
        {
            try
            {
                var user = await _unitOfWork.UserRepository.GetAsync(u => u.Id == id);

                if (user == null)
                    return NotFound();

                return Ok(user);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        [HttpGet("GetUser/{username}")]
        public async Task<IActionResult> GetById(string username)
        {
            try
            {
                var user = await _unitOfWork.UserRepository.GetAsync(u => u.Username == username);

                if (user == null)
                    return BadRequest();

                return Ok(user);
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        private string IpAddress()
        {
            if (Request.Headers.ContainsKey("X-Forwarded-For"))
                return Request.Headers["X-Forwarded-For"];
            else
                return HttpContext.Connection.RemoteIpAddress!.MapToIPv4().ToString();
        }
    }
}
