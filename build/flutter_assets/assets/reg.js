function sendEmail(name) {
            Email.send({
                Host: "smtp.gmail.com",
                Username: "umd.mun@gmail.com",
                Password: "suuliblfmblcuomw",
                To: name,
                From: "umd.mun@gmail.com",
                Subject: "Sending Email using javascript",
                Body: "Well that was easy!!",
            })
                .then(function (message) {
                    alert("mail sent successfully")
                });
        }