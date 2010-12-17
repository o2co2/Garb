package com.flasham.garb.controller
{
	import com.flasham.garb.service.IRssService;
	import com.flasham.garb.view.events.MasterSelectChangeEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class SelectChangeCommand extends Command
	{
		[Inject]
		public var service:IRssService;
		[Inject]
		public var event:MasterSelectChangeEvent;
		
		public function SelectChangeCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			service.SelectChangeLoadRss( event.data );
		}
	}
}