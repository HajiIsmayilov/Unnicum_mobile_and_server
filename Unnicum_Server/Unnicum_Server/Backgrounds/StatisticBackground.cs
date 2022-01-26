using Unnicum_Server.Models;
using Unnicum_Server.Models.Enums;
using Unnicum_Server.Repo;

namespace Unnicum_Server.Backgrounds
{
    public class StatisticBackground : BackgroundService
    {
        private readonly IUnitOfWork _unitOfWork;
        private Timer? timer = null;

        public StatisticBackground(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        private async void CheckStatistics(object? state)
        {
            Console.WriteLine("Checking");

            try
            {
                var challenges = await _unitOfWork.ChallengeRepository.GetAllAsync(c => c.Ended >= DateTimeOffset.Now);

                if (challenges != null)
                {

                    foreach (var challenge in challenges)
                    {
                        if (challenge.ChallengedPost.PostStatus != PostStatus.Passive ||
                            challenge.ChallengerPost.PostStatus != PostStatus.Passive) continue;

                        var winnerId = 0;

                        var loserId = 0;

                        var d = (await _unitOfWork.VoteRepository.GetAllAsync(v =>
                            challenge.ChallengedPost.User != null &&
                            v.SelectedUser.Id == challenge.ChallengedPost.User.Id))!.Count;

                        var r = (await _unitOfWork.VoteRepository.GetAllAsync(v =>
                            challenge.ChallengerPost.User != null &&
                            v.SelectedUser.Id == challenge.ChallengerPost.User.Id))!.Count;

                        if (r > d)
                        {
                            winnerId = challenge.ChallengerPost.User!.Id;

                            loserId = challenge.ChallengedPost.User!.Id;

                            challenge.ChallengerPost.PostStatus = PostStatus.Active;
                        }
                        else
                        {
                            winnerId = challenge.ChallengedPost.User!.Id;

                            loserId = challenge.ChallengerPost.User!.Id;

                            challenge.ChallengedPost.PostStatus = PostStatus.Active;
                        }

                        var challengeStatistic = new ChallengeStatistic
                        {
                            ChallengeId = challenge.Id,
                            WinnerId = winnerId,
                            LoserId = loserId
                        };

                        _unitOfWork.ChallengeRepository.Update(challenge);

                        _unitOfWork.ChallengeStatisticRepository.Add(challengeStatistic);

                        await _unitOfWork.SaveAsync();
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }

        protected override Task ExecuteAsync(CancellationToken stoppingToken)
        {
            Console.WriteLine("Started");

            timer = new Timer(CheckStatistics, null, TimeSpan.Zero, TimeSpan.FromSeconds(10));

            return Task.CompletedTask;
        }
    }
}
