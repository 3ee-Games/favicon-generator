# Favicon Generator

Generate multiple favicon files from a single input image.  It produces PNG icons in various sizes, a multi-resolution ICO file, and a basic web app manifest for PWAs.

## Dependencies

- **ImageMagick**: Required for image resizing and ICO generation.
  - Ubuntu/Debian: `sudo apt install imagemagick`
  - macOS: `brew install imagemagick`
  - Windows: Download from [ImageMagick website](https://imagemagick.org/script/download.php)

## Usage

Run with an input image and output directory:
```
./favicon_generator input_image.png output_dir
```
- If using Dune: `dune exec ./favicon_generator.exe input_image.png output_dir`
- The output directory will be created if it doesn't exist.
- Example: `./favicon_generator logo.png favicons/`