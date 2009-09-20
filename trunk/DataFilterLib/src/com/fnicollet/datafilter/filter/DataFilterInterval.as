package com.fnicollet.datafilter.filter {
  import com.fnicollet.util.Logger;

  import flash.events.Event;


  /**
   * DataFilter representing an interval of values (number between min and max)
   * @author fab
   */
  public class DataFilterInterval extends DataFilterBase {

    private var _min:Number = Number.NEGATIVE_INFINITY;

    private var _max:Number = Number.POSITIVE_INFINITY;


    /**
     *
     * @param parameters
     */
    public function DataFilterInterval(parameters:DataFilterParameters) {
      super(parameters);
    }

    /**
     * Returns the minimal value of the interval
     * @return mimimal value
     */
    public function get min():Number {
      return _min;
    }

    /**
     * Returns the maximal value of the interval
     * @return maximal value
     */
    public function get max():Number {
      return _max;
    }

    // check if the values are valid. if they are, the data is refreshed
    override protected function onFilterValuesChanged(event:Event = null):void {
      if (_parameters.filterValues && _parameters.filterValues.length > 1) {
        _min = Math.min(_parameters.filterValues[0], _parameters.filterValues[1]);
        _max = Math.max(_parameters.filterValues[0], _parameters.filterValues[1]);
      } else {
        trace("DataFilterInterval:InvalidValues, the data filter won't act OK");
      }
      super.onFilterValuesChanged();
    }

    // checks if the data if the data is in the specified interval
    private function isInInterval(item:Object):Boolean {
      var valueToFilter:Number = Number(item[filterKeys[0]]);
      var result:Boolean = true;
      var intervalOperator:String = filterOperator ? filterOperator : DataFilterIntervalOperator.INTERVAL_CLOSED;
      switch (intervalOperator) {
        case DataFilterIntervalOperator.INTERVAL_CLOSED:
          result = (valueToFilter >= min && valueToFilter <= max);
          break;
        case DataFilterIntervalOperator.INTERVAL_OPEN:
          result = (valueToFilter > min && valueToFilter < max);
          break;
        case DataFilterIntervalOperator.INTERVAL_OPEN_LEFT:
          result = (valueToFilter > min && valueToFilter <= max);
          break;
        case DataFilterIntervalOperator.INTERVAL_OPEN_RIGHT:
          result = (valueToFilter >= min && valueToFilter < max);
          break;
        default:
          Logger.getInstance().warn("DataFilterInterval::isInInterval: Unknown Operator: " + intervalOperator);
          break;
      }
      return result;
    }

    override public function apply(item:Object):Boolean {
      return applyConstraints(isInInterval(item));
    }

  }
}

