using System;
using System.Threading.Tasks;
using log4net;
using NuGet.Common;

namespace EdFi.Ods.Generator.Logging
{
    public class Log4NetLogger : ILogger
    {
        private readonly ILog _logger;

        public Log4NetLogger(ILog logger)
        {
            _logger = logger;
        }
        
        public void LogDebug(string data)
        {
            _logger.Debug(data);
        }

        public void LogVerbose(string data)
        {
            _logger.Debug(data);
        }

        public void LogInformation(string data)
        {
            _logger.Debug(data);
        }

        public void LogMinimal(string data)
        {
            _logger.Info(data);
        }

        public void LogWarning(string data)
        {
            _logger.Warn(data);
        }

        public void LogError(string data)
        {
            _logger.Error(data);
        }

        public void LogInformationSummary(string data)
        {
            throw new NotImplementedException();
        }

        public void Log(LogLevel level, string data)
        {
            switch (level)
            {
                case LogLevel.Verbose:
                    LogVerbose(data);

                    break;
                case LogLevel.Debug:
                    LogDebug(data);
                    break;
                case LogLevel.Information:
                    LogInformation(data);

                    break;
                case LogLevel.Minimal:
                    LogMinimal(data);
                    break;
                case LogLevel.Warning:
                    LogWarning(data);
                    break;
                case LogLevel.Error:
                    LogError(data);

                    break;
            }
        }

        public Task LogAsync(LogLevel level, string data)
        {
            Log(level, data);

            return Task.CompletedTask;
        }

        public void Log(ILogMessage message)
        {
            Log(message.Level, message.Message);
        }

        public Task LogAsync(ILogMessage message)
        {
            Log(message.Level, message.Message);

            return Task.CompletedTask;
        }
    }
}