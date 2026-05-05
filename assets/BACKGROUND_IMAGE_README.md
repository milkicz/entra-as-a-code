# Background Image for Entra Branding

Place your sign-in page background image here.

## Recommended Specifications

- **Format**: PNG, JPG, or JPEG
- **Size**: 1920 x 1080 pixels (16:9 aspect ratio)
- **File size**: Maximum 300 KB
- **Filename**: `background.jpg` or `background.png`

## How to Use

1. Add your background image file to this directory
2. Update [../env/dev.tfvars](../env/dev.tfvars):
   ```terraform
   branding_background_image = "./assets/background.jpg"
   ```
3. Run:
   ```powershell
   terraform apply -auto-approve -var-file="env/dev.tfvars"
   ```

The image will be displayed as the background of your Entra sign-in page.
