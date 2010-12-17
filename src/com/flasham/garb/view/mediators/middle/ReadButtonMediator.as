package com.flasham.garb.view.mediators.middle
{
	import com.flasham.garb.view.components.middle.ReadButtonView;
	import com.flasham.garb.view.events.ListToHtmlEvent;
	
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ReadButtonMediator extends Mediator
	{
		[Inject]
		public var view:ReadButtonView;
		
		public function ReadButtonMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			addViewListener( MouseEvent.CLICK , onClick );
		}
		
		public function onClick(e:MouseEvent):void
		{
			dispatch( new ListToHtmlEvent( ListToHtmlEvent.LIST_TO_HTML ,String(e.target.link)) );
		}
	}
}