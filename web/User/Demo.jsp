<input type="text" id="dateInput">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">

<script>
  $(function() {
    var allowedDays = [1, 5, 10, 15];

    // Find the next available date
    var today = new Date();
    var nextAvailableDate = null;

    while (!allowedDays.includes(today.getDate())) {
      today.setDate(today.getDate() + 1);
    }

    nextAvailableDate = today;

    // Set the default value to the next available date
    var defaultValue = $.datepicker.formatDate('yy-mm-dd', nextAvailableDate);
    $('#dateInput').val(defaultValue);

    $('#dateInput').datepicker({
      dateFormat: 'yy-mm-dd',
      minDate: 0, // Disable previous dates
      beforeShowDay: function(date) {
        var day = date.getDate();
        var isAllowed = allowedDays.includes(day);
        return [isAllowed];
      },
      beforeShow: function(input, inst) {
        inst.dpDiv.addClass('custom-datepicker');
      }
    });
  });
</script>

<style>
  .custom-datepicker .ui-datepicker-calendar td span.ui-state-default:not(.ui-state-disabled) {
    opacity: 0.5;
    pointer-events: none;
  }
</style>
