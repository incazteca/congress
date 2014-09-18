function toggle(item_id, user_id, tag_id){
    if ($("."+item_id).text() == 'Tag for Updates') {
        tag_item(item_id, user_id)
    }
    else if ($("."+item_id).text() == 'Tagged for Updates') {
        untag_item(item_id, tag_id)
    }
}

function tag_item(item_id, user_id){
    $.ajax({
        type: "POST",
        url: "/tags",
        data: { item_id: item_id, user_id: user_id },
        dataType: "json",
        success: function() {
            $("."+item_id).removeClass('btn-default')
            $("."+item_id).addClass('btn-success')
            $("."+item_id).text('Tagged for Updates')
        }
    })
}

function untag_item(item_id, tag_id){
    $.ajax({
        type: "DELETE",
        url: "/tags/"+tag_id,
        dataType: "json",
        success: function(data) {
            $("."+item_id).removeClass('btn-success')
            $("."+item_id).addClass('btn-default')
            $("."+item_id).text('Tag for Updates')
        }
    })
}
