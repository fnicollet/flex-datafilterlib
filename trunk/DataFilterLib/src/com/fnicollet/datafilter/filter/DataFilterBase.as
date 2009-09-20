package com.fnicollet.datafilter.filter {
  import com.fnicollet.util.Logger;

  import flash.events.Event;
  import flash.events.EventDispatcher;

  [Event(name="refreshDataProvider",type="flash.events.Event")]
  /**
   * Abstract class on which all filters are based.
   * Gives a basic implementation of IDataFilter and handles DataFilterParameters changes (refresh).
   * Shouldn't be instanciated on his own
   * @author fab
   */
  public class DataFilterBase extends EventDispatcher implements IDataFilter {

    public static const REFRESH_DATA_PROVIDER:String = "refreshDataProvider";

    /**
     * DataFilterParameters passed in the constructor. Contains the configuration of the DataFilter
     * @default
     */
    protected var _parameters:DataFilterParameters = null;

    /**
     *
     * @param parameters Configuration object that contains the informations for the instanciation and the binding
     */
    public function DataFilterBase(parameters:DataFilterParameters) {
      _parameters = parameters;
      _parameters.addEventListener(DataFilterParameters.FILTER_VALUES_CHANGED, onFilterValuesChanged);
      _parameters.addEventListener(DataFilterParameters.FILTER_KEYS_CHANGED, onFilterKeysChanged);
      _parameters.addEventListener(DataFilterParameters.FILTER_OPERATOR_CHANGED, onFilterOperatorChanged);
      _parameters.addEventListener(DataFilterParameters.FILTER_INVERT_CHANGED, onFilterInvertChanged);
      _parameters.addEventListener(DataFilterParameters.FILTER_ACTIVE_CHANGED, onFilterActiveChanged);
    }

    /**
     * Shortcut to get the filter operator from the parameters
     * @return the filter operator defined in the DataFilterParameters
     */
    protected function get filterOperator():String {
      return _parameters.filterOperator;
    }

    /**
     * Shortcut to get the filter keys from the parameters
     * @return the filter keys defined in the DataFilterParameters
     */
    protected function get filterKeys():Array {
      return _parameters.filterKeys;
    }

    /**
     * Event dispatched when the values change
     * @param event
     */
    protected function onFilterValuesChanged(event:Event = null):void {
      refreshDataProvider();
    }

    /**
     * Event dispatched when the keys change
     * @param event
     */
    protected function onFilterKeysChanged(event:Event = null):void {
      refreshDataProvider();
    }

    /**
     * Event dispatched when the active property change
     * @param event
     */
    protected function onFilterActiveChanged(event:Event = null):void {
      refreshDataProvider();
    }

    /**
     * Event dispatched when the invert property change
     * @param event
     */
    protected function onFilterInvertChanged(event:Event = null):void {
      refreshDataProvider();
    }

    /**
     * Event dispatched when the filter operator change
     * @param event
     */
    protected function onFilterOperatorChanged(event:Event = null):void {
      if (!_parameters.filterOperator) {
        Logger.getInstance().error("DataFilterInterval::onFilterOperatorChanged: Operator null");
      }
      refreshDataProvider();
    }

    /**
     * Dispatches an event to inform the DataFilterSet that the dataprovider needs to be refreshed
     * @param event
     * @see DataFilterSet
     */
    public function refreshDataProvider(event:Event = null):void {
      dispatchEvent(new Event(REFRESH_DATA_PROVIDER));
    }

    // common treatments for every filters
    /**
     * Needs to be called before returning the apply() method result in classes that sub-class DataFilterBase.
     * Will take in account the active and invert proprerties from the parameters
     * @param value Value that was going to be returned by the apply method
     * @return Boolean indicating if the value will be filtered or not (final)
     */
    protected function applyConstraints(value:Boolean):Boolean {
      if (!_parameters.active) {
        return true;
      }
      var finalValue:Boolean = value;
      if (_parameters.invert) {
        finalValue = !finalValue;
      }
      return finalValue;
    }

    /**
     * Basic implementation of the interface. Should be implemented by sub-classes
     * @param item Item of the data provider that will be filtered (or not)
     * @return false if the value should be filtered
     */
    public function apply(item:Object):Boolean {
      return true;
    }

  }
}

