terraform {
  required_providers {
    msgraph = {
      source = "Microsoft/msgraph"
    }
  }

  backend "azurerm" {}
}
