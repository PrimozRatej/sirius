## USERS
curl -k -H "Content-Type: application/json" -X POST -d '{
    "username": "admin",
    "password": "password",
    "email": "admin1@email.com"
}' https://localhost:8080/api/domain/user/sign_up

curl -k -H "Content-Type: application/json" -X POST -d '{
    "username": "admin1",
    "password": "admin1",
    "email": "admin1@email.com"
}' https://localhost:8080/api/domain/user/sign_up


curl -k -H "Content-Type: application/json" -X POST -d '{
    "username": "admin2",
    "password": "admin2",
    "email": "admin2@email.com"
}' https://localhost:8080/api/domain/user/sign_up


curl -k -H "Content-Type: application/json" -X POST -d '{
    "username": "admin3",
    "password": "admin3",
    "email": "admin3@email.com"
}' https://localhost:8080/api/domain/user/sign_up


curl -k -H "Content-Type: application/json" -X POST -d '{
    "username": "user1",
    "password": "user1",
    "email": "user1@email.com"
}' https://localhost:8080/api/domain/user/sign_up

curl -k -H "Content-Type: application/json" -X POST -d '{
    "username": "user2",
    "password": "user2",
    "email": "user2@email.com"
}' https://localhost:8080/api/domain/user/sign_up

curl -k -H "Content-Type: application/json" -X POST -d '{
    "username": "user3",
    "password": "user3",
    "email": "user3@email.com"
}' https://localhost:8080/api/domain/user/sign_up