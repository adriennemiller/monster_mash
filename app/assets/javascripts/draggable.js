$(function() {
  $('.draggable').draggable({
    containment: 'parent',
    stop: function( event, ui ) {}
  });

  $(".draggable").on( "dragstop", function( event, ui ) {
    section = ui.helper[0].id
    field_x = $(`#monster_${section}_x`)[0]
    field_y = $(`#monster_${section}_y`)[0]
    set_field_value_to_position(field_x, ui, 'left')
    set_field_value_to_position(field_y, ui, 'top')
  });

  function set_field_value_to_position(field, ui, side) {
    field.value = ui.position[side]
  }
});