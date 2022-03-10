package helper

import "strings"

type Response struct {
	Meta Meta        `json:"meta"`
	Data interface{} `json:"data"`
}

type Meta struct {
	Message string `json:"message"`
	Code    int    `json:"code"`
	Status  string `json:"status"`
}

func APIResponse(message string, code int, status string, data interface{}) Response {
	meta := Meta{
		Message: message,
		Code:    code,
		Status:  status,
	}

	jsonresponse := Response{
		Meta: meta,
		Data: data,
	}

	return jsonresponse
}

func FormatValidationError(err error) []string {
	var errors []string

	//for _, e := range err.(validator.ValidationErrors) {
	//	errors = append(errors, e.Error())
	//}

	for _, e := range strings.Split(err.Error(), "\n") {
		errors = append(errors, e)
	}

	return errors
}
