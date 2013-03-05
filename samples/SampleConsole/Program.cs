﻿using System;
using Pulsus;
using Pulsus.Targets;

namespace SampleConsole
{
	class Program
	{
		static void Main(string[] args)
		{
			LogManager.Configuration.LogKey = "Console";
			LogManager.Configuration.Targets.Clear();
			LogManager.Configuration.Targets.Add("database", new DatabaseTarget());

			LogManager.EventFactory.Create()
								   .Level(LoggingEventLevel.Trace)
								   .AddTags("console")
								   .Text("Pushing from console")
								   .Push();

			Console.WriteLine("Press any key to finish...");
			Console.ReadKey();
		}
	}
}
