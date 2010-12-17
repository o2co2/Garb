package com.flasham.garb.view.mediators
{
	import com.flasham.garb.view.components.OneMiddleLeftView;
	import com.flasham.garb.view.events.HtmlLeftEvent;
	import com.flasham.garb.view.events.ListToHtmlEvent;
	
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class OneMiddleLeftMediators extends Mediator
	{
		[Inject]
		public var view:OneMiddleLeftView;
		
		public function OneMiddleLeftMediators()
		{
			super();
		}
		
		override public function onRegister():void
		{
			addContextListener( ListToHtmlEvent.LIST_TO_HTML , ListToHtml );
		}
		
		public function ListToHtml( e:ListToHtmlEvent ):void
		{
			view.currentState = "Html";
			view.htmlLeft.html.location = e._url;
		}
	}
}