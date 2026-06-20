# Ayesha Physio — Flutter Web

A responsive, mobile-first physiotherapy practice website built with Flutter Web, Material 3, `go_router`, and `url_launcher`.

## Run locally

```bash
flutter pub get
flutter run -d chrome
```

## Production builds

Standard web build:

```bash
flutter build web --release
```

WebAssembly build (verify package/browser compatibility before choosing it for production):

```bash
flutter build web --wasm
```

The deployable output is written to `build/web`.

## Business details

Update every business-specific value in:

```text
lib/config/site_config.dart
```

Replace all placeholders before launch, including city, phone, WhatsApp number, email, address, qualifications, certifications, service areas, domain, timings, social links, and maps URL. Only publish genuine testimonials with explicit permission.

## SEO checklist

Flutter renders most visible content dynamically, so this project provides the strongest practical baseline rather than promising server-rendered SEO.

Before launch:

1. Update titles, descriptions, canonical URL, Open Graph values, Twitter metadata, and JSON-LD placeholders in `web/index.html`.
2. Replace every `https://www.example.com` URL in `web/sitemap.xml` and `web/robots.txt`.
3. Replace the default favicon and PWA icons in `web/`.
4. Add a real social sharing image and update the `og:image` and `twitter:image` URLs.
5. Validate structured data with Google Rich Results Test.
6. Submit `sitemap.xml` in Google Search Console after deployment.

## Clean URLs and SPA rewrites

The app calls `usePathUrlStrategy()` before `runApp()`, so URLs do not contain `#`.
Your host must rewrite unknown paths to `/index.html` so direct visits and refreshes work.

Ready-to-use configuration is included:

- Firebase Hosting: `firebase.json`
- Netlify: `netlify.toml`
- Vercel: `vercel.json`

For another static provider, configure a fallback/rewrite from `/*` to `/index.html` with a successful `200` response.

## Deployment

### Firebase Hosting

```bash
flutter build web --release
firebase init hosting
firebase deploy
```

Choose `build/web` as the public directory and enable single-page-app rewrites. The included `firebase.json` already contains the rewrite.

### Netlify

Connect the repository or upload `build/web`. The included `netlify.toml` sets the build command, publish directory, and SPA redirect.

### Vercel

Build locally or configure Flutter in the Vercel build environment. Publish `build/web`; `vercel.json` provides the SPA rewrite.

### Other static hosting

Run `flutter build web --release`, upload the contents of `build/web`, then configure all clean routes to serve `index.html`.

## Main routes

- `/`
- `/services`
- `/about`
- `/book-appointment`
- `/blog`
- `/blog/:slug`
- `/privacy-policy`
- `/medical-disclaimer`

## Content and safety

Blog content is educational and includes a medical disclaimer. The booking form does not send data to a backend; it composes a WhatsApp message on the visitor's device.
