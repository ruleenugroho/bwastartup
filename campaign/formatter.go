package campaign

type CampaignFormatter struct {
	ID               int    `json:"id"`
	UserID           int    `json:"user_id"`
	Name             string `json:"name"`
	ShortDescription string `json:"short_description"`
	ImageURL         string `json:"image_url"`
	GoalAmount       int    `json:"goal_amount"`
	CurrentAmount    int    `json:"current_amount"`
}

func FormatCampaign(campaign Campaign) CampaignFormatter {
	CampaignFormatter := CampaignFormatter{
		ID:               campaign.ID,
		UserID:           campaign.UserID,
		Name:             campaign.Name,
		ShortDescription: campaign.ShortDescription,
		ImageURL:         "",
		GoalAmount:       campaign.GoalAmount,
		CurrentAmount:    campaign.CurrentAmount,
	}

	if len(campaign.CampaignImages) > 0 {
		CampaignFormatter.ImageURL = campaign.CampaignImages[0].FileName
	}

	return CampaignFormatter
}

func FormatCampaigns(campaigns []Campaign) []CampaignFormatter {
	CampaignsFormatter := []CampaignFormatter{}

	for _, campaign := range campaigns {
		CampaignFormatter := FormatCampaign(campaign)
		CampaignsFormatter = append(CampaignsFormatter, CampaignFormatter)
	}

	return CampaignsFormatter
}
