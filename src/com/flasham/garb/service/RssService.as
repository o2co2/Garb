package com.flasham.garb.service
{
	import com.flasham.garb.model.IRSS20;
	import com.flasham.garb.model.IRSSList;
	import com.flasham.garb.model.vo.RSSXML;
	import com.flasham.garb.view.events.BarEvent;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.*;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoaderDataFormat;
	import flash.utils.ByteArray;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.robotlegs.mvcs.Actor;

	public class RssService extends Actor implements IRssService
	{
		public var _rssUrl:XML;
		public var queue:LoaderMax;
		[Inject]
		public var rss20:IRSS20;
		[Inject]
		public var rssList:IRSSList;

		/**
		 *启动
		 *
		 */
		public function startup():void
		{
			queue=new LoaderMax({name: "mainQueue", onProgress: progressHandler,onChildProgress: childProgressHandler , onComplete: completeHandler, onChildComplete: childCompleteHandler, onError: errorHandler, maxConnections: 1});
			var loader:XMLLoader=new XMLLoader("assets/RssUrl.xml", {name: "rssUrl", onComplete: onUrlComplete});
			loader.load();
		}

		public function onUrlComplete(e:LoaderEvent):void
		{
			_rssUrl=LoaderMax.getLoader("rssUrl").content;
			loadRss(_rssUrl.item[0].@rss, "穿衣打扮");
			rssList.FormatXML(_rssUrl);
		}

///////////////////////////////////////////////////////////////////////////////////////////////load/////////////////////////////////////////////////
		/**
		 *加载Rss的内容
		 * @param _rssUrlStr rss的订阅地址
		 * @param _name 相对应的名字（可以根据name来确实是否已经加载过）；
		 *
		 */
		public function loadRss(_rssUrlStr:String, _name:String):void
		{
			queue.append(new XMLLoader(_rssUrlStr, {name: _name}));
			queue.load();
		}

		public function SelectChangeLoadRss(_item:RSSXML):void
		{
			trace(_item.rss, "  ", _item.name);
			loadRss(_item.rss, _item.name);
		}

////////////////////////////////////////////////////////////////////////////////////////////////Load event//////////////////////////////////////////
		public function progressHandler(e:LoaderEvent):void
		{
			
		}

		/**
		 * 全部加载完成
		 * @param e
		 *
		 */
		public function completeHandler(e:LoaderEvent):void
		{

		}
		
		public function childProgressHandler(e:LoaderEvent):void
		{
			updataEvent(queue.rawProgress);
		}
		
		/**
		 *子项加载完成
		 * @param e
		 *
		 */
		public function childCompleteHandler(e:LoaderEvent):void
		{
			dispatch(new BarEvent(BarEvent.COMPLETE, 100));
			/*if(_rssUrl != null)
			{
				if( _rssUrl.item.(@name==e.target.name).@charSet == "gb2312" )
				{
					var byteArr:ByteArray = new ByteArray();
					byteArr.writeUTFBytes( String(e.target.content) );
					byteArr.position = 0;
					trace(byteArr.readMultiByte(byteArr.length , "gb2312" ) );
				}
			}*/
			CreateRss(XML(e.target.content));
		}

		/**
		 *加载出错
		 * @param e
		 *
		 */
		public function errorHandler(e:LoaderEvent):void
		{
			trace("error occured with " + e.target + ": " + e.text);
		}

		/**
		 *给进度条发送跟新进度
		 * @param _int
		 *
		 */
		public function updataEvent(_int:Number):void
		{
			dispatch(new BarEvent(BarEvent.BAR_UPDATA, int(queue.rawProgress * 100)));
		}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		

		/**
		 * 格式化加载进来的数据
		 * @param _xml
		 */
		public function CreateRss(_xml:XML):void
		{
//			格式化数据
			rss20.FormatRSS(_xml);
		}
	}
}