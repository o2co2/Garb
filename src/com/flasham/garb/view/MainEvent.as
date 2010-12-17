package com.flasham.garb.view
{
	import flash.events.Event;
	
	public class MainEvent extends Event
	{
		public static const MAIN_CLOSE:String = "mainclose";
		public static const MAIN_MIN:String = "mainmin";
		
		public function MainEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new MainEvent( type , bubbles , cancelable );
		}
	}
}