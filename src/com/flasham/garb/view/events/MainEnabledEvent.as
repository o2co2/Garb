package com.flasham.garb.view.events
{
	import flash.events.Event;
	
	public class MainEnabledEvent extends Event
	{
		public static const MAIN_ENABLD:String = "mainenbld";
		
		public function MainEnabledEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new MainEnabledEvent(type, bubbles, cancelable);
		}
	}
}