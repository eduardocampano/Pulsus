﻿using System;
using Pulsus.Configuration;
using Pulsus.Internal;

namespace Pulsus
{
	public static class LogManager
	{
        private static PulsusConfiguration _configuration;
        private static IEventFactory _eventsFactory;
		private static IEventDispatcher _eventDispatcher;

        static LogManager()
        {
			_configuration = PulsusConfiguration.Default;
            _eventsFactory = new DefaultEventFactory();
			_eventDispatcher = new DefaultEventDispatcher(_configuration.Targets.Values);
        }

		public static IEventFactory EventFactory
		{
			get
			{
				return _eventsFactory;
			}
			set
			{
				if (value == null)
					throw new ArgumentNullException("value");

				_eventsFactory = value;	
			}
		}

		public static IEventDispatcher EventDispatcher
		{
			get
			{
				return _eventDispatcher;
			}
			set
			{
				if (value == null)
					throw new ArgumentNullException("value");

				_eventDispatcher = value;
			}
		}

		public static void Push(LoggingEvent loggingEvent)
		{
			Push(new[] { loggingEvent });
		}

		public static void Push(LoggingEvent[] loggingEvents)
		{
			if (!Configuration.Enabled)
				return;

			_eventDispatcher.Push(loggingEvents);
		}

        public static PulsusConfiguration Configuration
        {
            get 
            { 
                return _configuration; 
            }
			set
			{
				if (value == null)
					throw new ArgumentNullException("value");

				_configuration = value;
			}
        }
	}
}
