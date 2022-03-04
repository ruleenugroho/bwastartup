package main

import (
	"log"
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

	userHandler := handler.NewUserHandler(userService)

	router := gin.Default()
	api := router.Group("/api/v1")
	api.POST("/users", userHandler.RegisterUser)
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
