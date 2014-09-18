function tag_item(item_id, user_id) {
    $.ajax({
        type: "POST",
        url: "/tags",
        data: { item_id: item_id, user_id: user_id },
        success: function() {
            alert ("Get congress on the phone")
            $("'."+item_id+"'").removeClass('btn-default')
            $("'."+item_id+"'").addClass('btn-success')
        }
    })
}

function untag_item(tag_id) {
    $.ajax({
        type: "DELETE",
        url: "/tags/"+tag_id,
        success: function() {
            alert ("Get me the president")
            $("'."+item_id+"'").removeClass('btn-success')
            $("'."+item_id+"'").addClass('btn-default')
        }
    })
}
