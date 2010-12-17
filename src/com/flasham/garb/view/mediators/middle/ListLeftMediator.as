package com.flasham.garb.view.mediators.middle
{
	import com.flasham.garb.view.components.middle.ListLeftView;
	import com.flasham.garb.view.events.MiddleLeftEvent;
	
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ListLeftMediator extends Mediator
	{
		[Inject]
		public var view:ListLeftView;
		
		public function ListLeftMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			addContextListener( MiddleLeftEvent.LIST_DATAUP , onListDataup );
		}
		
		public function onListDataup( e:MiddleLeftEvent ):void
		{
			view.data = e.RSSarr;
		}
	}
}