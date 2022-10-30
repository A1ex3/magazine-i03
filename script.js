function login()
{
    let log = $('#login').val()
    let pas = $('#passw').val()

    $.get('auth.php', {login: log, password: pas}, function(data) {
        let otvet = JSON.parse(data)
        //если произошла ошибка
        if ('error' in otvet) {
            alert(otvet['error']['text'])
        }
        else if ('user' in otvet) {
            document.cookie = `auth=${otvet['user']['token']}; path=/;`;
            alert('вы успешно авторизовались')
            window.location.replace("tovary.html");
        }
        else {
            alert('непредвидинная ошибка')
            console.log(data)
        }
    })
}

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
            document.cookie = `auth=${otvet['user']['token']}; path=/;`;
            alert('вы успешно зарегестрировались')
            $(location).attr("href", "tovary.html");
        }
        else {
            alert('непредвидинная ошибка')
            console.log(data)
        }
    })
}

function setShop()
{
    let cook = Cookies.get('auth');
    let idTovara = $('#idtovar').val()
    let countt = $('#count').val()

    $.get('shop.pokupka.php', {id_tovara:idTovara,count:countt}, function(data) {
        let otvet = JSON.parse(data)
        if ('error' in otvet) {
            alert(otvet['error']['text'])
            $(location).attr("href", "login.html");
        }
        else if ('response' in otvet) {
            alert('Спасибо за покупку')
            $(location).attr("href", "tovary.html");
        }
        else {
            alert('непредвидинная ошибка')
            console.log(data)
        }
    })
}