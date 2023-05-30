
// ждем, пока загрузится вся страница
document.addEventListener("DOMContentLoaded", function () {

    // получаем поле ввода даты
    var dateField = document.getElementById("task_date");

    // создаем новое поле ввода времени
    var timeField = document.createElement("input");
    timeField.type = "time";
    timeField.name = "task[time]";
    timeField.className = "input";

    // вставляем новое поле ввода после поля ввода даты
    dateField.parentNode.insertBefore(timeField, dateField.nextSibling);

    // обработчик события отправки формы
    document.querySelector('.form').addEventListener('submit', function (event) {
        event.preventDefault(); // отменяем стандартное поведение формы

        // получаем значения из полей формы
        var name = document.getElementById('task_name').value;
        var date = document.getElementById('task_date').value;
        var time = document.getElementsByName('task[time]')[0].value;

        // объединяем значения даты и времени в одну строку
        var dateTime = date + 'T' + time;

        // создаем объект Date из строки даты и времени
        var taskDate = new Date(dateTime);

        // получаем текущую дату и время
        var currentDate = new Date();

        // вычисляем разницу между датами в миллисекундах
        var diff = taskDate - currentDate;

        // запускаем таймер на определенное количество миллисекунд
        setTimeout(function () {
            // воспроизводим звуковой сигнал
            var audio = new Audio('/path/to/sound.mp3');
            audio.play();

            // или показываем всплывающее окно
            var notification = new Notification('Task Alert', {
                body: name
            });
        }, diff);
    });
});

