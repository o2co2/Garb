package com.flasham.garb
{
	import com.flasham.garb.controller.SelectChangeCommand;
	import com.flasham.garb.controller.ServiceStartupCommand;
	import com.flasham.garb.model.IMonth;
	import com.flasham.garb.model.IRSS20;
	import com.flasham.garb.model.IRSSList;
	import com.flasham.garb.model.Month;
	import com.flasham.garb.model.RSS20;
	import com.flasham.garb.model.RSSList;
	import com.flasham.garb.model.vo.IItem;
	import com.flasham.garb.model.vo.Item;
	import com.flasham.garb.model.vo.RSSXML;
	import com.flasham.garb.service.*;
	import com.flasham.garb.view.MainGarbView;
	import com.flasham.garb.view.MainGarbViewMediators;
	import com.flasham.garb.view.components.OneMiddleLeftView;
	import com.flasham.garb.view.components.OneTopView;
	import com.flasham.garb.view.components.ProgressBarView;
	import com.flasham.garb.view.components.middle.HtmlLeftView;
	import com.flasham.garb.view.components.middle.ListLeftView;
	import com.flasham.garb.view.components.middle.ReadButtonView;
	import com.flasham.garb.view.components.middle.RightListMasterView;
	import com.flasham.garb.view.events.MasterSelectChangeEvent;
	import com.flasham.garb.view.mediators.OneMiddleLeftMediators;
	import com.flasham.garb.view.mediators.OneTopMediator;
	import com.flasham.garb.view.mediators.ProgressBarMediators;
	import com.flasham.garb.view.mediators.middle.HtmlLeftMeditor;
	import com.flasham.garb.view.mediators.middle.ListLeftMediator;
	import com.flasham.garb.view.mediators.middle.ReadButtonMediator;
	import com.flasham.garb.view.mediators.middle.RightListMasterMediator;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Context;
	
	public class GarbContext extends Context
	{	
		
		override public function startup():void
		{
			commandMap.mapEvent( ServiceStartupEvent.SERVICE_STARTUP , ServiceStartupCommand );
			commandMap.mapEvent( MasterSelectChangeEvent.SELECT_CHANGE , SelectChangeCommand );
			
			injector.mapSingletonOf( IRssService , RssService );
			injector.mapSingletonOf( IRSSList , RSSList );
			//injector.mapSingletonOf( IItem , Item );
			injector.mapSingletonOf( IRSS20 , RSS20 );
			injector.mapSingletonOf( IMonth , Month );
			
			mediatorMap.mapView( MainGarbView , MainGarbViewMediators );
			
			mediatorMap.mapView( OneTopView , OneTopMediator );
			mediatorMap.mapView( OneMiddleLeftView , OneMiddleLeftMediators );
			mediatorMap.mapView( ListLeftView , ListLeftMediator );
			mediatorMap.mapView( ProgressBarView , ProgressBarMediators );
			
			mediatorMap.mapView( HtmlLeftView , HtmlLeftMeditor );
			mediatorMap.mapView( ReadButtonView , ReadButtonMediator );
			
			mediatorMap.mapView( RightListMasterView , RightListMasterMediator );
			
		}
	}
}