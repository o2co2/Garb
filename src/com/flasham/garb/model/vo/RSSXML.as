package com.flasham.garb.model.vo
{
	public class RSSXML
	{
		private var _name:String;
		private var _rss:String;
		private var _url:String;
		private var _charSet:String;
		
		public function RSSXML()
		{
		}
		
		/**
		 *唯一标志名字 
		 * @return 
		 * 
		 */		
		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}
		
		/**
		 *rss地址 
		 * @return 
		 * 
		 */		
		public function get rss():String
		{
			return _rss;
		}

		public function set rss(value:String):void
		{
			_rss = value;
		}
		
		/**
		 *网站地址 
		 * @return 
		 * 
		 */		
		public function get url():String
		{
			return _url;
		}

		public function set url(value:String):void
		{
			_url = value;
		}
		
		/**
		 *编码格式 
		 * @return 
		 * 
		 */		
		public function get charSet():String
		{
			return _charSet;
		}

		public function set charSet(value:String):void
		{
			_charSet = value;
		}

	}
}