package com.flasham.garb.model.vo
{
	public interface IItem
	{
		/**
		 * 标题
		 */
		function get title():String;
		function set title(_str:String):void;
		
		/**
		 * 链接
		 */
		function get link():String;
		function set link(_str:String):void;
		
		/**
		 * 内容
		 */
		function get description():String;
		function set description(_str:String):void;
		
		/**
		 * 作者
		 */
		function get creators():String;
		function set creators(_str:String):void;
	}
}