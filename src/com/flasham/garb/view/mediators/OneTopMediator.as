package com.flasham.garb.view.mediators
{
	import com.flasham.garb.view.MainEvent;
	import com.flasham.garb.view.components.OneTopView;
	
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class OneTopMediator extends Mediator
	{
		[Inject]
		public var view:OneTopView
		
		public function OneTopMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			eventMap.mapListener( view.close_btn , MouseEvent.CLICK , onClick );
			eventMap.mapListener( view.min_btn   , MouseEvent.CLICK , onClick );
			eventMap.mapListener( view.skin_btn  , MouseEvent.CLICK , onClick );
			eventMap.mapListener( view.menu_btn  , MouseEvent.CLICK , onClick );
			eventMap.mapListener( view.feed_btn  , MouseEvent.CLICK , onClick );
		}
		
		public function onClick( e:MouseEvent ):void
		{
			switch(e.target.name)
			{
				case "close_btn" :
					dispatch( new MainEvent( MainEvent.MAIN_CLOSE ) );
					break;
				case "min_btn" :
					dispatch( new MainEvent( MainEvent.MAIN_MIN ) );
					break;
				default:
					
			}
			
		}
	}
}