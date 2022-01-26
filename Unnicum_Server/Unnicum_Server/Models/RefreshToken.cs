﻿using Unnicum_Server.Models.Abstraction;

namespace Unnicum_Server.Models
{
    public record RefreshToken : Entity
    {
        public string? Token { get; set; }
        public DateTime Expires { get; set; }
        public bool IsExpired => DateTime.UtcNow >= Expires;
        public DateTime Created { get; set; }
        public string? CreatedByIp { get; set; }
        public DateTime? Revoked { get; set; }
        public string? RevokedByIp { get; set; }
        public string? ReplacedByToken { get; set; }
        public bool IsActive => Revoked == null && !IsExpired;

        public int UserId { get; set; }
        public User User { get; set; }
    }
}
