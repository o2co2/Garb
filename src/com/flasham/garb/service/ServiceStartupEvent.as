package com.flasham.garb.service
{
	import flash.events.Event;
	
	public class ServiceStartupEvent extends Event
	{
		public static const SERVICE_STARTUP:String = "servicestartup"
		
		public function ServiceStartupEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new ServiceStartupEvent( type , bubbles , cancelable );
		}
	}
}