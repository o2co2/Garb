package com.flasham.garb.controller
{
	import com.flasham.garb.service.IRssService;
	import org.robotlegs.mvcs.Command;
	public class ServiceStartupCommand extends Command
	{

		public function ServiceStartupCommand()
		{
			super();
		}

		[Inject]
		public var serviceSrartu:IRssService

		override public function execute():void
		{
			serviceSrartu.startup();
		}
	}
}