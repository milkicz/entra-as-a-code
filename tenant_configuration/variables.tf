variable "project_name" {
  description = "Short project identifier used as a naming prefix."
  type        = string
}

variable "tenant_id" {
  description = "The Azure AD tenant ID."
  type        = string
}


variable "environment" {
  description = "Environment name, for example dev, test, or prod."
  type        = string
}

variable "branding_background_color" {
  description = "Background color for sign-in page (hex format, e.g., #FFFFFF)."
  type        = string
  default     = "#FFFFFF"
}

variable "branding_sign_in_page_text" {
  description = "Custom text displayed on the sign-in page."
  type        = string
  default     = ""
}

variable "branding_username_hint_text" {
  description = "Hint text for the username field."
  type        = string
  default     = ""
}

variable "branding_background_image" {
  description = "Path to background image file (optional). Supported formats: PNG, JPG, JPEG. Max 300KB."
  type        = string
  default     = ""
}
