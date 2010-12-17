package com.flasham.garb.view.events
{
	import flash.events.Event;
	
	public class ListToHtmlEvent extends Event
	{
		public static const LIST_TO_HTML:String = "listtohtml" ;
		public var _url:String;
		
		public function get url():String
		{
			return this._url;
		}
		
		public function ListToHtmlEvent(type:String ,url:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this._url = url;
		}
		
		override public function clone():Event
		{
			return new ListToHtmlEvent(type,url, bubbles, cancelable);
		}
	}
}