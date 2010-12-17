package com.flasham.garb.view.mediators.middle
{
	import com.flasham.garb.view.components.middle.RightListMasterView;
	import com.flasham.garb.view.events.BarEvent;
	import com.flasham.garb.view.events.MasterSelectChangeEvent;
	import com.flasham.garb.view.events.RightMasterListEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.events.IndexChangeEvent;
	
	public class RightListMasterMediator extends Mediator
	{
		[Inject]
		public var view:RightListMasterView;
		
		public function RightListMasterMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			addContextListener( RightMasterListEvent.Up_DATA , onUpData );
			addViewListener( IndexChangeEvent.CHANGE , onChange );
		}
		
		public function onUpData(e:RightMasterListEvent ):void
		{
			view.data = e.data;
		}
		
		public function onChange( e:IndexChangeEvent ):void
		{
//			trace(e.currentTarget.selectedIndices);
//			trace(view.selectedItem);
			dispatch( new MasterSelectChangeEvent( MasterSelectChangeEvent.SELECT_CHANGE , view.selectedItem ) );
			dispatch( new BarEvent( BarEvent.BAR_UPDATA , 0 )  );
		}
	}
}