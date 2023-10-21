$('.btn').tilt({ speed: 1000, scale: 1.2});
$('.btn2').tilt({ speed: 1000, scale: 1.2});
$('.btn3').tilt({ speed: 1000, scale: 1.2});
$('.btn4').tilt({ speed: 1000, scale: 1.2});
$('.btn5').tilt({ speed: 1000, scale: 1.2});

$('body').hide();

window.addEventListener('message', (event) => {
    if (event.data.type === "ui") {
        if (event.data.status) {
            $('body').fadeIn();
        } else {
            $('body').fadeOut();
        }
    }
});

document.onkeydown = e => {
    if (e.keyCode === 27)
        $.post('http://kPauseMenuFREE/close', JSON.stringify({}));
}

document.onclick = e => {
    switch (e.target.id) {
        case "1": 
            $.post('http://kPauseMenuFREE/close', JSON.stringify({}));
            break;
        case "2":
            $.post('http://kPauseMenuFREE/map', JSON.stringify({}));
            break;
        case "3":
            $.post('http://kPauseMenuFREE/settings', JSON.stringify({}));
            break;
        case "4":
            window.invokeNative('openUrl', 'https://discord.gg/BxdvrmYZ6M')
            $.post('http://kPauseMenuFREE/close', JSON.stringify({}));
            break;
        case "5":
            $.post('http://kPauseMenuFREE/quit', JSON.stringify({}));
            break;
    }
}