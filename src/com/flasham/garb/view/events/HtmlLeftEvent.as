package com.flasham.garb.view.events
{
	import flash.events.Event;
	
	public class HtmlLeftEvent extends Event
	{
		public static const READ_BUTTON_CLICK:String = "readbuttonclick";
		public var _url:String;
		
		public function get url():String
		{
			return this._url;
		}
		public function set url(_str:String):void
		{
			this._url = _str;
		}
		
		public function HtmlLeftEvent(type:String, url:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this._url = url;
		}
		
		override public function clone():Event
		{
			return new HtmlLeftEvent(type, url, bubbles, cancelable)
		}
	}
}