package com.flasham.garb.view.events
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class MiddleLeftEvent extends Event
	{
		public static const LIST_DATAUP:String = "listdataup";
		private var _RSSarr:ArrayCollection;
		
		public function get RSSarr():ArrayCollection
		{
			return this._RSSarr;
		}
		
		public function MiddleLeftEvent(type:String, RSSarr:ArrayCollection , bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this._RSSarr = RSSarr;
		}
		
		override public function clone():Event
		{
			return new MiddleLeftEvent(type, RSSarr , bubbles, cancelable);
		}
	}
}