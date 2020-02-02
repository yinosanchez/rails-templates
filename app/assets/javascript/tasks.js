function toggle_task(event){
    checkbox = event.target
    id = $(checkbox).val()
    $.post('/tasks/toggle/'+$(checkbox).val(), function(data){
        li = $(checkbox).parent()
        li.html(data)
        $('#task-done-'+id).click(toggle_task)
    })
}
$(document).ready(function(){
    $('.task-item input[type=checkbox]').click(toggle_task);
})   
    