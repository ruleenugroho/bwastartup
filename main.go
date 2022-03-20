package main

import (
	"net/http"
	"startup/auth"
	"startup/campaign"
	"startup/config"
	"startup/handler"
	"startup/helper"
	"startup/payment"
	"startup/transaction"
	"startup/user"
	"strings"

	"github.com/dgrijalva/jwt-go"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func main() {
	
	var db *gorm.DB = config.SetupKoneksi()
	defer config.CloseKoneksiDatabase(db)
	
	authservice := auth.NewService()

	userRepository := user.NewRepository(db) //berhubungan dengan db
	userService := user.NewService(userRepository) //berhubungan dengan skema data
	userHandler := handler.NewUserHandler(userService, authservice)

	campaignRepository := campaign.NewRepository(db)
	campaignService := campaign.NewService(campaignRepository)
	campaignHandler := handler.NewCampaignHandler(campaignService)

	transactionRepository := transaction.NewRepository(db)
	paymentService	:= payment.NewService()
	transactionService := transaction.NewService(transactionRepository, campaignRepository, paymentService)
	transactionHandler := handler.NewTransactionHandler(transactionService)	
	
	router := gin.Default()
	router.Use(CORSMiddleware())
	router.Static("/images", "./images")
	api := router.Group("/api/v1")


	router.GET("", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{"ok":"ok"})
	})

	api.POST("/users", userHandler.RegisterUser) //pendaftaran pengguna
	api.POST("/sessions", userHandler.Login) //login
	api.POST("/emailcek", userHandler.CheckEmailAvailability) //cek apakah email sudah ada atau belum
	api.POST("/avatars", authMiddleware(authservice, userService), userHandler.UploadAvatar)
	api.GET("/users/fetch", authMiddleware(authservice, userService), userHandler.FetchUser)

	api.GET("/campaigns", campaignHandler.GetCampaigns) //semua campaign
	api.GET("/campaign/:id", campaignHandler.GetCampaign) //campaign per id
	api.POST("/campaigns", authMiddleware(authservice, userService), campaignHandler.CreateCampaign)
	api.PUT("/campaigns/:id", authMiddleware(authservice, userService), campaignHandler.UpdateCampaign) //campaign tiap user id
	api.POST("/campaign-images", authMiddleware(authservice, userService), campaignHandler.UploadImage)

	api.GET("/campaigns/:id/transactions", authMiddleware(authservice, userService), transactionHandler.GetCampaignTransactions) //semua transaksi campaign
	api.GET("/transactions", authMiddleware(authservice, userService), transactionHandler.GetUserTransactions)
	api.POST("/transactions", authMiddleware(authservice, userService), transactionHandler.CreateTransaction)
	api.POST("/transactions/notification", transactionHandler.GetNotification)

	router.Run()
}

func CORSMiddleware() gin.HandlerFunc {
    return func(c *gin.Context) {
        c.Writer.Header().Set("Access-Control-Allow-Origin", "*")
        c.Writer.Header().Set("Access-Control-Allow-Credentials", "true")
        c.Writer.Header().Set("Access-Control-Allow-Headers", "Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization, accept, origin, Cache-Control, X-Requested-With")
        c.Writer.Header().Set("Access-Control-Allow-Methods", "POST, OPTIONS, GET, PUT")

        if c.Request.Method == "OPTIONS" {
            c.AbortWithStatus(204)
            return
        }

        c.Next()
    }
}

func authMiddleware(authService auth.Service, userService user.Service) gin.HandlerFunc{
	
	//gin handler middleware
	return func (c *gin.Context){
		authHeader := c.GetHeader("Authorization") //authorization: bearer token
		if !strings.Contains(authHeader, "Bearer"){
			response := helper.APIResponse("Unathorization", http.StatusUnauthorized, "error", nil)
			c.AbortWithStatusJSON(http.StatusUnauthorized, response) //kalau error maka proses akan diberhentikan
			return
		}

		//nilainya kan bearer tokentoken, nah dipisahkan dengan spasi
		tokenString := ""
		arrayToken := strings.Split(authHeader, " ")

		if len(arrayToken) == 2 {
			tokenString = arrayToken[1]
		}

		token, err := authService.ValidateToken(tokenString)
		if err != nil{
			response := helper.APIResponse("Unathorization", http.StatusUnauthorized, "error", nil)
			c.AbortWithStatusJSON(http.StatusUnauthorized, response) //kalau error maka proses akan diberhentikan
			return
		}
		claim, ok := token.Claims.(jwt.MapClaims)
		if !ok || !token.Valid{
			response := helper.APIResponse("Unathorization", http.StatusUnauthorized, "error", nil)
			c.AbortWithStatusJSON(http.StatusUnauthorized, response) //kalau error maka proses akan diberhentikan
			return
		}

		userID := int(claim["user_id"].(float64))
		user, err := userService.GetUserByID(userID)
		if err != nil{
			response := helper.APIResponse("Unathorization", http.StatusUnauthorized, "error", nil)
			c.AbortWithStatusJSON(http.StatusUnauthorized, response) //kalau error maka proses akan diberhentikan
			return
		}
		c.Set("currentUser", user)
	}
}

// //Sistem Middleware
// ambil nilai header Authorization: Bearer tokentokentoken
// dari header authorization, kita ambil nilai tokennya saja
// kita validasi token
// kita ambil user_id
// ambil user dari db berdasarkan user_id
// kita set content isinya user
