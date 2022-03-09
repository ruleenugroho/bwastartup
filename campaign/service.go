package campaign

type Service interface {
	GetCampaigns(userID int) ([]Campaign, error)
}

type service struct {
	repository Repository
}

func NewService(repository Repository) *service {
	return &service{repository}
}

func (s *service) GetCampaigns(userID int) ([]Campaign, error) {
	var Campaign []Campaign
	var err error
	if userID != 0 {
		Campaign, err = s.repository.FindByUserID(userID)
	} else {
		Campaign, err = s.repository.FindAll()
	}

	if err != nil {
		return Campaign, err
	}

	return Campaign, nil
}
