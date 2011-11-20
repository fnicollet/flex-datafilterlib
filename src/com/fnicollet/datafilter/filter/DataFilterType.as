package com.fnicollet.datafilter.filter {

  /**
   * Defines the constant used for the filterType attribute for the basic filters
   * @author fab
   */
  public class DataFilterType {

    /**
     * Filter based on a single value
     * @see DataFilterSingleValue
     * @default
     */
    public static const SINGLE_VALUE:String = "SingleValue";

    /**
     * Filter based on an interval (min/max)
     * @see DataFilterInterval
     * @default
     */
    public static const INTERVAL:String = "Inverval";

    /**
     *
     */
    public function DataFilterType() {
    }

  }
}

