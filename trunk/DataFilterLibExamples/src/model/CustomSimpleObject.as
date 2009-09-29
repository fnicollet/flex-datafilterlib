package model {

  /**
   * Custom Object to represent a model.
   * Only one property which can be accessed through the constructor for easy creation.
   */
  [Bindable]
  public class CustomSimpleObject {
    private var _startDate:Date = null;

    public function get startDate():Date {
      return _startDate;
    }

    public function CustomSimpleObject(__startDate:Date = null) {
      _startDate = __startDate;
    }

  }
}