function register()
{
    let log = $('#login').val()
    let pas = $('#passw').val()

    $.post('register.php', {login: log, password: pas}, function(data) {
        let otvet = JSON.parse(data)
        //если произошла ошибка
        if ('error' in otvet) {
            alert(otvet['error']['text'])
        }
        else if ('user' in otvet) {
            document.cookie = "auth=1; path=/;";
            alert('вы успешно авторизовались')
            $(location).attr("href", "tovary.html");
        }
        else {
            alert('непредвидинная ошибка')
            console.log(data)
        }
    })
}