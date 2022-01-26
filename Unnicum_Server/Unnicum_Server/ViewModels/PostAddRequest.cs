using Unnicum_Server.Models;
using Unnicum_Server.Models.Enums;

namespace Unnicum_Server.ViewModels
{
    public class PostAddRequest
    {
        public Media Video { get; set; }

        public SubCategory SubCategory { get; set; }

        public string Description { get; set; }

        public bool CanSeeChild { get; set; }

        public Address Address { get; set; }

        public string Username { get; set; }

        public AreaLevel AreaLevel { get; set; }

        public DateTimeOffset Date { get; set; }
    }
}
