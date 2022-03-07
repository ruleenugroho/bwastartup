package main

import (
	"log"
	"startup/auth"
	"startup/handler"
	"startup/user"

	"github.com/gin-gonic/gin"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

func main() {
	//	//Sistem Layering
	//	//- input dari user
	//	//- Handler mapping input dari user ke struct input
	//	//- Service mapping struct input ke struct User
	//	//- Repository save struct User ke db
	//	//- db
	dsn := "root:@tcp(127.0.0.1:3306)/bwastartup?charset=utf8mb4&parseTime=True&loc=Local"
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})

	if err != nil {
		log.Fatal(err.Error())
	}

	userRepository := user.NewRepository(db)
	userService := user.NewService(userRepository)
	authService := auth.NewService()

	//token, err := authService.ValidateToken("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyfQ.lchslLcaVh4VKxjqEmUGid1VAVMbxtK4XrOuHNGyXNo")
	//if err != nil {
	//	fmt.Println("ERROR")
	//}

	//if token.Valid {
	//	fmt.Println("VALID")
	//} else {
	//	fmt.Println("INVALID")
	//}

	//userByEmail, err := userRepository.FindByEmail("rully@gmail.com")
	//if err != nil {
	//	fmt.Println(err.Error())
	//}
	//if userByEmail.ID == 0 {
	//	fmt.Println("User tidak ditemukan")

	//} else {
	//	fmt.Println(userByEmail.Name)
	//}
	//input := user.LoginInput{
	//	Email:    "nugroho@domain.com",
	//	Password: "qwe123",
	//}

	//user, err := userService.Login(input)
	//if err != nil {
	//	fmt.Println("Terjadi kesalahan")
	//	fmt.Println(err.Error())
	//}

	//fmt.Println(user.Email)
	//fmt.Println(user.Name)

	userHandler := handler.NewUserHandler(userService, authService)

	router := gin.Default()
	api := router.Group("/api/v1")

	api.POST("/users", userHandler.RegisterUser)
	api.POST("/sessions", userHandler.Login)
	api.POST("/email_checkers", userHandler.CheckEmailAvailability)
	api.POST("/avatars", userHandler.UploadAvatar)

	router.Run()

	//fmt.Println("Connection to database is safe")

	//var users []user.User
	//db.Find(&users)

	//for _, user := range users {
	//	fmt.Println(user.Name)
	//	fmt.Println(user.Email)
	//	fmt.Println("-----------")
	//}

	//router := gin.Default()
	//router.GET("/handler", handler)
	//router.Run()
}

//func handler(c *gin.Context) {
//	dsn := "root:@tcp(127.0.0.1:3306)/bwastartup?charset=utf8mb4&parseTime=True&loc=Local"
//	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})

//	if err != nil {
//		log.Fatal(err.Error())
//	}

//	fmt.Println("Connection to database is safe")

//	var users []user.User
//	db.Find(&users)

//	c.JSON(http.StatusOK, users)

//}
