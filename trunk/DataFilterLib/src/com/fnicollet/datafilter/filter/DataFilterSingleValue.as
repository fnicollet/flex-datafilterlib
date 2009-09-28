package com.fnicollet.datafilter.filter {
  import flash.events.Event;


  /**
   * DataFilter that will affect only one value (String value is the best example)
   * @author fab
   */
  public class DataFilterSingleValue extends DataFilterBase {

    private var _values:Array = null;

    /**
     * @see DataFilterBase
     * @param parameters configuration object (DataFilterParameters)
     */
    public function DataFilterSingleValue(parameters:DataFilterParameters) {
      super(parameters);
    }

    /**
     * Returns the values that will be filtered or not
     * @return
     */
    public function get values():Array {
      return _values;
    }

    override protected function onFilterValuesChanged(event:Event = null):void {
      if (_parameters.filterValues && _parameters.filterValues.length > 0) {
        _values = _parameters.filterValues;
        super.onFilterValuesChanged();
      }
    }

    // Loops over multiple filterValues with an OR Operator
    private function filterMultipleValues(valueToFilter:String):Boolean {
      var filtered:Boolean = false;
      for each (var value:String in values) {
        filtered = filtered || isFiltered(valueToFilter, value);
      }
      return filtered;
    }

    // @valueToFilter => value in the data, corresponding to the field
    private function isFiltered(valueToFilter:String, value:String):Boolean {
      var result:Boolean = false;
      var intervalOperator:String = filterOperator ? filterOperator : DataFilterSingleValueOperator.EQUALS_TO;
      var pattern:RegExp = null;
      if (_parameters.ignoreCase) {
        valueToFilter = valueToFilter.toLowerCase();
        value = value.toLowerCase();
      }
      switch (intervalOperator) {
        case DataFilterSingleValueOperator.EQUALS_TO:
          result = (valueToFilter == value);
          break;
        case DataFilterSingleValueOperator.LIKE:
          result = (valueToFilter.indexOf(value) != -1);
          break;
        case DataFilterSingleValueOperator.STARTS_WITH:
          pattern = new RegExp("^" + value, "g");
          result = (valueToFilter.search(pattern) != -1);
          break;
      }
      return result;
    }

    override public function apply(item:Object):Boolean {
      if (!_values || filterKeys == null) {
        return true;
      }
      var valueToFilter:String = String(item[filterKeys[0]]);

      var result:Boolean = filterMultipleValues(valueToFilter);
      return applyConstraints(result);
    }

  }
}

