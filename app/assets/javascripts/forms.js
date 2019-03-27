// What?! JavaScript?! 
// Our application is very graphic-oriented and we are unable 
// to give necessary immediate visual feedback to the user when 
// they pick some option for the monster's appearance with Rails forms.
// Therefore, we chose to value the user experience over all else.

$(document).on('turbolinks:load', function(){
  // ======= DRAGGABLES =======
  $('.draggable').draggable({
    containment: 'parent',
    stop: function( event, ui ) {}
  });

  $(".draggable").on( "dragstop", function( event, ui ) {
    section = ui.helper[0].id
    field_x = $(`#monster_${section}_x`)[0]
    field_y = $(`#monster_${section}_y`)[0]
    set_field_value_to_position(field_x, ui.position['left'])
    set_field_value_to_position(field_y, ui.position['top'])
  });

  function set_field_value_to_position(field, val) {
    field.value = val
  }

  if ($(".slider").length > 0) {   
    // ======= SLIDER =======
    $("#head_scale_x").slider({
      value: $(`#monster_head_scale_x`)[0].value,
      min: 0.5,
      max: 1.5,
      step: 0.01,
      orientation: "vertical",
      slide: function( event, ui ) {}
    });
    $("#head_scale_y").slider({
      value: $(`#monster_head_scale_y`)[0].value,
      min: 0.5,
      max: 1.5,
      step: 0.01,
      orientation: "vertical",
      slide: function( event, ui ) {}
    });
    $("#torso_scale_x").slider({
      value: $(`#monster_torso_scale_x`)[0].value,
      min: 0.5,
      max: 1.5,
      step: 0.01,
      orientation: "vertical",
      slide: function( event, ui ) {}
    });
    $("#torso_scale_y").slider({
      value: $(`#monster_torso_scale_y`)[0].value,
      min: 0.5,
      max: 1.5,
      step: 0.01,
      orientation: "vertical",
      slide: function( event, ui ) {}
    });
    $("#leg_scale_x").slider({
      value: $(`#monster_leg_scale_x`)[0].value,
      min: 0.5,
      max: 1.5,
      step: 0.01,
      orientation: "vertical",
      slide: function( event, ui ) {}
    });
    $("#leg_scale_y").slider({
      value: $(`#monster_leg_scale_y`)[0].value,
      min: 0.5,
      max: 1.5,
      step: 0.01,
      orientation: "vertical",
      slide: function( event, ui ) {}
    });

    $(".slider").on( "slide", function( event, ui ) {
      field_scale = $(`#monster_${$(this).attr("id")}`)[0]
      section = $(this).attr("id").split('_')[0]
      orientation = $(this).attr("id").split('_').pop().toUpperCase()
      set_field_value_to_slider_value(field_scale, ui.value, section, orientation)
    });

    function set_field_value_to_slider_value(field, val, section, orientation) {
      field.value = val
      $(`#${section}`).css({
        '-webkit-transform' : `scale${orientation}(${val})`,
        '-moz-transform'    : `scale${orientation}(${val})`,
        '-ms-transform'     : `scale${orientation}(${val})`,
        '-o-transform'      : `scale${orientation}(${val})`,
        'transform'         : `scale${orientation}(${val})`

      
      });
    }
  }

  // ======= BODY PART SECTION =======
  $("#monster_head_id").change(function() {
    $("#head")[0].src = `/assets/heads/${$("#monster_head_id option:selected")[0].text}.svg`
  })

  $("#monster_torso_id").change(function() {
    $("#torso")[0].src = `/assets/torsos/${$("#monster_torso_id option:selected")[0].text}.svg`
  })

  $("#monster_leg_id").change(function() {
    $("#leg")[0].src = `/assets/legs/${$("#monster_leg_id option:selected")[0].text}.svg`
  })
});