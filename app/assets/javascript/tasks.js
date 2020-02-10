function toggle_task(event){
    checkbox = event.target
    id = $(checkbox).val()
    $.post('/tasks/toggle/'+$(checkbox).val(), function(data){
        li = $('#task-'+id)
        li.html(data)
        $('#task-done-'+id).click(toggle_task)
        $('#task-destroy-'+id).click(destroy_task)
    })
}

function destroy_task(event){
    event.preventDefault()
    link = event.target
    $.post($(link).attr('href'), function(data){
        console.log(data)
        li = $('#task-'+data.id)
        li.remove()
    })
}
$(document).ready(function(){
    $('.task-item input[type=checkbox]').click(toggle_task);
    $('.task-destroy').click(destroy_task);
})   
    