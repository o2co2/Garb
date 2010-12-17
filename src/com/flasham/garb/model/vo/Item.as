package com.flasham.garb.model.vo
{
	import org.robotlegs.mvcs.Actor;
	
	public class Item extends Actor implements IItem
	{
		private var _title:String;
		private var _link:String;
		private var _description:String;
		private var _creators:String;
		private var _pubDate:String;
		
		public function Item()
		{
			super();
		}
		
		/**
		 * 标题
		 */
		public function get title():String
		{
			return this._title;
		}
		
		public function set title(_str:String):void
		{
			this._title = _str;
		}
		
		/**
		 * 链接
		 */
		public function get link():String
		{
			return this._link;
		}
		
		public function set link(_str:String):void
		{
			this._link = _str;
		}
		
		/**
		 * 内容
		 */
		public function get description():String
		{
			return this._description;
		}
		
		public function set description(_str:String):void
		{
			this._description = _str;
		}
		
		/**
		 * 作者
		 */
		public function get creators():String
		{
			return this._creators;
		}
		
		public function set creators(_str:String):void
		{
			this._creators = _str;
		}
		
		/**
		 *文章发布时间 
		 * @return 
		 * 
		 */
		public function get pubDate():String
		{
			return _pubDate;
		}
		
		public function set pubDate(value:String):void
		{
			_pubDate = value;
		}
	}
}