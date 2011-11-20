package com.fnicollet.datafilter.filter {

  /**
   * Constants that can be used to define the Operator of a DataFilterSingleValue
   * @see DataFilterSingleValue
   * @author fab
   */
  public class DataFilterSingleValueOperator {

    /**
     * The value needs to be strictly equal to the value to filter
     * @default
     */
    public static const EQUALS_TO:String = "EqualsTo";

    /**
     * The value needs to be start with the same value than the value to filter
     * @default
     */
    public static const STARTS_WITH:String = "StartWith";

    /**
     * The value needs to be contain the value to filter (like a LIKE %value% in SQL)
     * @default
     */
    public static const LIKE:String = "Like";

    public function DataFilterSingleValueOperator() {
    }

  }
}

