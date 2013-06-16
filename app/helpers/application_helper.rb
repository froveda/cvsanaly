module ApplicationHelper
  def default_js
    result = "
    #{javascript_include_tag 'jquery.form.min'}
    <script type='text/javascript'>
      $(document).ready(function(){
        $('.filter_results_btn').on('click', function(){
          var options = {
              success:       showResponse  // post-submit callback
          };
          $('.filter_results').html('#{content_tag :div, image_tag("spinner.gif"), :class => "spinner_container"}');
          $('form').ajaxSubmit(options);
          return false;
        });

        $('#repository').on('change', function(){
          $.post('#{change_dates_path}', {repository: $(this).val()})
          .done(function(data) {
            $('.date_filters').html(data);
          });
        });
      });
      function showResponse(responseText, statusText, xhr, $form)  {
        $('.filter_results').html(responseText);
      }
    </script>"
  end
end
