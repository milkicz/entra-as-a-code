# Company Branding Assets

Place your branding image files in this directory:

- `banner-logo.png` - Wide logo for sign-in page header (recommended: 280x60 px, max 10 KB)
- `square-logo-light.png` - Square logo for light backgrounds (recommended: 240x240 px, max 10 KB)
- `square-logo-dark.png` - Square logo for dark backgrounds (recommended: 240x240 px, max 10 KB)
- `background.jpg` - Sign-in page background image (recommended: 1920x1080 px, max 300 KB)

## Enabling Image Assets

After adding files here, uncomment the corresponding lines in `branding.tf`:

```hcl
banner_logo       = filebase64("${path.module}/assets/banner-logo.png")
square_logo_light = filebase64("${path.module}/assets/square-logo-light.png")
square_logo_dark  = filebase64("${path.module}/assets/square-logo-dark.png")
background_image  = filebase64("${path.module}/assets/background.jpg")
```

Supported formats: PNG, JPG, JPEG
