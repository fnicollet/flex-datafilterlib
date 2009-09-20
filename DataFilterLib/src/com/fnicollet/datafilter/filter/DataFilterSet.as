package com.fnicollet.datafilter.filter {
  import flash.events.Event;

  import mx.collections.ArrayCollection;
  import mx.core.UIComponent;


  [DefaultProperty("dataFilterParameters")]
  /**
   * Contains a set of DataFilter. Used to filter an arrayCollection (filterFunction)
   * @author fab
   */
  public class DataFilterSet extends UIComponent {

    private var _dataFilters:Array /* of IDataFilter*/ = null;

    private var _data:ArrayCollection = null;

    /**
     *
     * @param __data data to filter
     */
    public function DataFilterSet(__data:ArrayCollection = null) {
      _dataFilters = [];
      if (__data) {
        data = __data;
      }
    }

    // getters and setters
    // getters
    /**
     * Returns the data filters of the set (instances of IDataFilter)
     * @return An array of all the dataFilters in the set
     */
    public function getDataFilters():Array {
      return _dataFilters;
    }

    // setters
    /**
     *
     * @param value Data to filter
     */
    public function set data(value:ArrayCollection):void {
      _data = value;
      _data.filterFunction = apply;
    }

    /**
     *
     * @param value Array of DataFilterParameters
     */
    public function set dataFilterParameters(value:Array):void {
      executeBindings();
      for each (var dataFilterParameters:DataFilterParameters in value) {
        addDataFilter(dataFilterParameters);
      }
    }

    /**
     * Refresh the dataprovider so that the filters have an effect
     */
    private function refreshData(event:Event = null):void {
      if (_data) {
        _data.refresh();
      }
    }


    /**
     * Adds a dataFilter to the set. Can be used to add DataFilter in AS3 at runtime
     * @param parameters Configuration (DataFilterParameters) used to instanciate the data filter
     */
    public function addDataFilter(parameters:DataFilterParameters):void {
      // TODO vérifier si on a deja une valeur existante
      var dataFilter:IDataFilter = DataFilterFactory.createDataFilter(parameters);
      if (!dataFilter) {
        trace("ChartDataFilterSet::Can't create filter: " + parameters);
        return;
      }
      dataFilter.addEventListener(DataFilterBase.REFRESH_DATA_PROVIDER, refreshData);
      _dataFilters.push(dataFilter);
      refreshData();
    }

    /**
     * apply the filter set (used to be bound to the filterFunction of ArrayCollection)
     * @param item Item to filter (or not)
     * @return false if the data must be filtered by any of the DataFilter in the set
     */
    public function apply(item:Object):Boolean {
      for each (var dataFilter:IDataFilter in getDataFilters()) {
        if (!dataFilter.apply(item)) {
          return false;
        }
      }
      return true;
    }

  }
}

