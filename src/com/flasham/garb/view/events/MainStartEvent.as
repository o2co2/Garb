package com.flasham.garb.view.events
{
	import flash.events.Event;
	
	public class MainStartEvent extends Event
	{
		public static const MAIN_START:String = "mainstart";
		
		public function MainStartEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new MainStartEvent(type, bubbles, cancelable);
		}
	}
}